const fs = require('fs');
const path = require('path');
const sass = require('sass');
const CleanCSS = require('clean-css');

// ============================================
// 유틸리티 함수
// ============================================

/**
 * 폴더 삭제 함수 (재귀적)
 */
function deleteFolderSync(folderPath) {
    if (fs.existsSync(folderPath)) {
        fs.readdirSync(folderPath).forEach((file) => {
            const curPath = path.join(folderPath, file);
            if (fs.lstatSync(curPath).isDirectory()) {
                deleteFolderSync(curPath);
            } else {
                fs.unlinkSync(curPath);
            }
        });
        fs.rmdirSync(folderPath);
    }
}

/**
 * 폴더 비우기 함수 (폴더는 유지, 내용만 삭제)
 */
function emptyFolderSync(folderPath) {
    if (fs.existsSync(folderPath)) {
        fs.readdirSync(folderPath).forEach((file) => {
            const curPath = path.join(folderPath, file);
            if (fs.lstatSync(curPath).isDirectory()) {
                deleteFolderSync(curPath);
            } else {
                fs.unlinkSync(curPath);
            }
        });
    }
}

/**
 * 폴더 및 파일 복사 함수
 */
function copyFolderSync(source, target, excludeDirs = []) {
    fs.mkdirSync(target, { recursive: true });

    const entries = fs.readdirSync(source, { withFileTypes: true });

    for (const entry of entries) {
        const sourcePath = path.join(source, entry.name);
        const targetPath = path.join(target, entry.name);

        // 제외할 디렉토리인 경우 스킵
        if (excludeDirs.includes(entry.name)) {
            continue;
        }

        if (entry.isDirectory()) {
            copyFolderSync(sourcePath, targetPath, excludeDirs);
        } else {
            fs.copyFileSync(sourcePath, targetPath);
        }
    }
}

// ============================================
// SCSS 컴파일 함수
// ============================================

/**
 * CSS Minify
 */
function minifyCSS(cssContent) {
    const minified = new CleanCSS().minify(cssContent);
    if (minified.errors.length > 0) {
        console.error(`CSS Minify 오류:`, minified.errors);
        return cssContent;
    }
    return minified.styles;
}

/**
 * SCSS 파일 컴파일 (내용만 반환)
 */
function compileSCSS(filePath) {
    try {
        const result = sass.compile(filePath);
        return result.css;
    } catch (error) {
        console.error(`${filePath} 변환 중 오류 발생:`, error.message);
        return '';
    }
}

/**
 * 메인 SCSS 파일들 컴파일
 */
function compileMainSCSS(scssDir) {
    if (!fs.existsSync(scssDir)) {
        return '';
    }

    const scssFiles = fs.readdirSync(scssDir).filter(file => {
        return file.endsWith('.scss') && !file.startsWith('_');
    });

    let combinedCSS = '';
    scssFiles.forEach(file => {
        const filePath = path.join(scssDir, file);
        console.log(`   SCSS 컴파일: ${file}`);
        const css = compileSCSS(filePath);
        if (css) {
            combinedCSS += css + '\n';
        }
    });

    return combinedCSS;
}

/**
 * 컴포넌트 SCSS 컴파일
 */
function compileComponentSCSS(componentPath) {
    let combinedCSS = '';
    
    // 컴포넌트 폴더에서 SCSS 파일 찾기
    const scssFiles = fs.readdirSync(componentPath).filter(file => file.endsWith('.scss'));
    
    scssFiles.forEach(file => {
        const filePath = path.join(componentPath, file);
        try {
            const result = sass.compile(filePath);
            combinedCSS += result.css + '\n';
        } catch (error) {
            console.error(`   ${file} 컴파일 오류:`, error.message);
        }
    });

    // scss 하위 폴더가 있는 경우
    const scssSubDir = path.join(componentPath, 'scss');
    if (fs.existsSync(scssSubDir)) {
        const nestedScssFiles = fs.readdirSync(scssSubDir).filter(file => file.endsWith('.scss'));
        nestedScssFiles.forEach(file => {
            const filePath = path.join(scssSubDir, file);
            try {
                const result = sass.compile(filePath);
                combinedCSS += result.css + '\n';
            } catch (error) {
                console.error(`   ${file} 컴파일 오류:`, error.message);
            }
        });
    }

    return combinedCSS;
}

// ============================================
// 컴포넌트 처리 함수
// ============================================

/**
 * 컴포넌트 폴더 찾기
 */
function findComponentFolders(srcPath) {
    const componentsPath = path.join(srcPath, 'components');
    if (!fs.existsSync(componentsPath)) {
        return [];
    }

    const componentFolders = fs.readdirSync(componentsPath, { withFileTypes: true })
        .filter(dirent => dirent.isDirectory())
        .map(dirent => ({
            name: dirent.name,
            path: path.join(componentsPath, dirent.name)
        }));

    return componentFolders;
}

/**
 * 컴포넌트 HTML 추출
 */
function extractComponentHTML(componentPath) {
    const htmlFiles = fs.readdirSync(componentPath).filter(file => file.endsWith('.html'));

    if (htmlFiles.length === 0) {
        return { content: '', scripts: [], styles: [] };
    }

    const htmlPath = path.join(componentPath, htmlFiles[0]);
    const htmlContent = fs.readFileSync(htmlPath, 'utf8');

    // 스크립트 태그 추출
    const scriptMatches = htmlContent.match(/<script\b[^>]*src=["'][^"']*\.js[^>]*><\/script>/g) || [];
    
    // 스타일 태그 추출
    const styleMatches = htmlContent.match(/<link\b[^>]*href=["'][^"']*\.css[^>]*>/g) || [];

    // 본문 내용 (스크립트와 스타일 제외)
    let bodyContent = htmlContent;
    
    scriptMatches.forEach(script => {
        bodyContent = bodyContent.replace(script, '');
    });
    
    styleMatches.forEach(style => {
        bodyContent = bodyContent.replace(style, '');
    });

    return {
        content: bodyContent.trim(),
        scripts: scriptMatches,
        styles: styleMatches
    };
}

/**
 * 컴포넌트 태그 처리 ({{component-name}} → 실제 HTML)
 */
function processComponentTags(htmlContent, componentFolders) {
    let processedHTML = htmlContent;
    let headScripts = [];
    
    componentFolders.forEach(component => {
        const componentTag = `{{${component.name}}}`;
        
        if (processedHTML.includes(componentTag)) {
            const { content, scripts } = extractComponentHTML(component.path);
            
            // 컴포넌트 내용으로 태그 교체
            processedHTML = processedHTML.replace(new RegExp(componentTag, 'g'), content);
            
            // 스크립트 경로 수정
            const modifiedScripts = scripts.map(script => {
                return script.replace(/(src=["'])(\.\.\/)*assets\//g, '$1./assets/');
            });
            
            headScripts = [...headScripts, ...modifiedScripts];
        }
    });
    
    // 헤드 태그에 스크립트 삽입
    if (headScripts.length > 0) {
        const headMatch = processedHTML.match(/<head[^>]*>([\s\S]*?)<\/head>/i);
        if (headMatch) {
            const headContent = headMatch[1];
            const newHeadContent = headContent + '\n' + headScripts.join('\n');
            processedHTML = processedHTML.replace(headMatch[0], `<head>${newHeadContent}</head>`);
        }
    }
    
    return processedHTML;
}

/**
 * index.html에 컴포넌트 호출이 있는지 확인
 */
function hasComponentCalls(htmlContent, componentFolders) {
    if (!htmlContent || !componentFolders || componentFolders.length === 0) {
        return false;
    }
    
    for (const component of componentFolders) {
        const componentTag = `{{${component.name}}}`;
        if (htmlContent.includes(componentTag)) {
            return true;
        }
    }
    
    return false;
}

// ============================================
// 빌드 함수
// ============================================

/**
 * cmp-dev 방식 빌드 (컴포넌트 통합)
 */
function buildWithComponents(srcPath, componentFolders) {
    console.log('\n📦 컴포넌트 통합 빌드 (cmp-dev 방식)...\n');
    
    const scssDir = path.join(srcPath, 'assets/scss');
    const cssDir = path.join(srcPath, 'assets/css');
    const indexPath = path.join(srcPath, 'index.html');
    const mainHtmlPath = path.join(srcPath, 'main.html');
    
    // CSS 디렉토리 생성
    fs.mkdirSync(cssDir, { recursive: true });
    
    // 1. 메인 SCSS 컴파일
    console.log('1️⃣  메인 SCSS 컴파일...');
    let mainCssContent = compileMainSCSS(scssDir);
    
    // 2. 컴포넌트 SCSS 컴파일
    console.log('2️⃣  컴포넌트 SCSS 컴파일...');
    let componentCssContent = '';
    componentFolders.forEach(component => {
        console.log(`   컴포넌트: ${component.name}`);
        const css = compileComponentSCSS(component.path);
        if (css) {
            componentCssContent += `/* Component: ${component.name} */\n${css}\n`;
        }
    });
    
    // 3. CSS 병합 및 저장
    const combinedCSS = mainCssContent + '\n' + componentCssContent;
    const minifiedCSS = minifyCSS(combinedCSS);
    
    // index.html에서 CSS 파일명 추출
    const indexContent = fs.readFileSync(indexPath, 'utf8');
    const cssLinkMatch = indexContent.match(/<link[^>]*href=["']\.\/assets\/css\/([^"']*\.css)[^>]*>/);
    
    let mainCssFile;
    if (cssLinkMatch && cssLinkMatch[1]) {
        mainCssFile = path.join(cssDir, cssLinkMatch[1]);
    } else {
        mainCssFile = path.join(cssDir, 'main.css');
    }
    
    fs.writeFileSync(mainCssFile, minifiedCSS, 'utf8');
    console.log(`   ✅ CSS 저장: ${path.basename(mainCssFile)}`);
    
    // 4. HTML 컴포넌트 통합 및 main.html 생성
    console.log('3️⃣  컴포넌트 HTML 통합...');
    const processedHTML = processComponentTags(indexContent, componentFolders);
    fs.writeFileSync(mainHtmlPath, processedHTML, 'utf8');
    console.log(`   ✅ main.html 생성 완료`);
    
    return mainHtmlPath;
}

/**
 * dev 방식 빌드 (SCSS만 컴파일)
 */
function buildWithoutComponents(srcPath) {
    console.log('\n📦 기본 빌드 (dev 방식)...\n');
    
    const scssDir = path.join(srcPath, 'assets/scss');
    const cssDir = path.join(srcPath, 'assets/css');
    const indexPath = path.join(srcPath, 'index.html');
    
    // CSS 디렉토리 생성
    fs.mkdirSync(cssDir, { recursive: true });
    
    // 1. SCSS 컴파일
    console.log('1️⃣  SCSS 컴파일...');
    const mainCssContent = compileMainSCSS(scssDir);
    
    if (mainCssContent) {
        const minifiedCSS = minifyCSS(mainCssContent);
        
        // index.html에서 CSS 파일명 추출
        const indexContent = fs.readFileSync(indexPath, 'utf8');
        const cssLinkMatch = indexContent.match(/<link[^>]*href=["']\.\/assets\/css\/([^"']*\.css)[^>]*>/);
        
        let mainCssFile;
        if (cssLinkMatch && cssLinkMatch[1]) {
            mainCssFile = path.join(cssDir, cssLinkMatch[1]);
        } else {
            mainCssFile = path.join(cssDir, 'style.css');
        }
        
        fs.writeFileSync(mainCssFile, minifiedCSS, 'utf8');
        console.log(`   ✅ CSS 저장: ${path.basename(mainCssFile)}`);
    }
    
    return indexPath;
}

// ============================================
// 배포 함수
// ============================================

/**
 * 배포 실행 함수
 */
function deploy(projectName, subFolder) {
    const rootDir = path.join(__dirname, '..'); // 루트 디렉토리
    const projectDir = path.join(rootDir, projectName); // 프로젝트 디렉토리
    
    // 하위 폴더가 지정되면 해당 폴더 사용, 아니면 sample 폴더 사용
    const targetFolder = subFolder || 'sample';
    const sourceDir = path.join(projectDir, targetFolder); // 소스 폴더 경로
    const srcPath = path.join(sourceDir, 'src'); // src 폴더 경로
    const docsDir = path.join(rootDir, 'docs'); // docs 폴더 경로

    // 프로젝트 폴더 확인
    if (!fs.existsSync(projectDir)) {
        console.error(`❌ Error: 프로젝트 폴더가 없습니다: ${projectName}`);
        process.exit(1);
    }

    // 소스 폴더 확인
    if (!fs.existsSync(sourceDir)) {
        console.error(`❌ Error: 폴더가 없습니다: ${sourceDir}`);
        console.log(`\n💡 Tip: ${projectName} 폴더 내 사용 가능한 폴더 목록:`);
        
        const folders = fs.readdirSync(projectDir, { withFileTypes: true })
            .filter(dirent => dirent.isDirectory())
            .map(dirent => dirent.name);
        folders.forEach(f => console.log(`   - ${f}`));
        
        process.exit(1);
    }

    // src 폴더 확인
    if (!fs.existsSync(srcPath)) {
        console.error(`❌ Error: src 폴더가 없습니다: ${srcPath}`);
        process.exit(1);
    }

    console.log(`
    ╔═══════════════════════════════════════════════════════════╗
    ║                                                           ║
    ║   🚀 GitHub Pages 배포 시작                               ║
    ║                                                           ║
    ╚═══════════════════════════════════════════════════════════╝
    `);
    
    console.log(`📂 프로젝트: ${projectName}`);
    console.log(`📁 소스 폴더: ${targetFolder}`);
    console.log(`📁 전체 경로: ${srcPath}`);

    // 빌드 타입 결정
    const indexPath = path.join(srcPath, 'index.html');
    const componentsPath = path.join(srcPath, 'components');
    const componentFolders = findComponentFolders(srcPath);
    
    let indexContent = '';
    if (fs.existsSync(indexPath)) {
        indexContent = fs.readFileSync(indexPath, 'utf8');
    } else {
        console.error(`❌ Error: index.html 파일이 없습니다: ${indexPath}`);
        process.exit(1);
    }
    
    const hasComponents = fs.existsSync(componentsPath) && componentFolders.length > 0;
    const hasComponentTags = hasComponentCalls(indexContent, componentFolders);
    const useCmpDev = hasComponents && hasComponentTags;
    
    console.log(`\n🔍 빌드 타입: ${useCmpDev ? 'cmp-dev (컴포넌트 통합)' : 'dev (기본)'}`);
    
    // 빌드 실행
    let sourceHtmlPath;
    if (useCmpDev) {
        sourceHtmlPath = buildWithComponents(srcPath, componentFolders);
    } else {
        sourceHtmlPath = buildWithoutComponents(srcPath);
    }
    
    // docs 폴더 비우기
    console.log('\n4️⃣  docs 폴더 비우기...');
    if (fs.existsSync(docsDir)) {
        emptyFolderSync(docsDir);
    }
    fs.mkdirSync(docsDir, { recursive: true });
    console.log(`   ✅ docs 폴더 준비 완료`);
    
    // 파일 복사
    console.log('\n5️⃣  파일 복사...');
    
    // HTML 복사 (main.html 또는 index.html → docs/index.html)
    // 절대 경로를 상대 경로로 변환 (/theme/ → ./theme/, /assets/ → ./assets/)
    const targetIndexPath = path.join(docsDir, 'index.html');
    let htmlContent = fs.readFileSync(sourceHtmlPath, 'utf8');
    
    // 경로 변환: /theme/ → ./theme/, /assets/ → ./assets/
    htmlContent = htmlContent.replace(/href=["']\/theme\//g, 'href="./theme/');
    htmlContent = htmlContent.replace(/src=["']\/theme\//g, 'src="./theme/');
    htmlContent = htmlContent.replace(/href=["']\/assets\//g, 'href="./assets/');
    htmlContent = htmlContent.replace(/src=["']\/assets\//g, 'src="./assets/');
    htmlContent = htmlContent.replace(/url\(["']?\/theme\//g, 'url("./theme/');
    htmlContent = htmlContent.replace(/url\(["']?\/assets\//g, 'url("./assets/');
    
    fs.writeFileSync(targetIndexPath, htmlContent, 'utf8');
    console.log(`   ✅ ${path.basename(sourceHtmlPath)} → index.html (경로 변환 완료)`);
    
    // assets 폴더 복사 (scss 제외)
    const assetsSource = path.join(srcPath, 'assets');
    const assetsTarget = path.join(docsDir, 'assets');
    if (fs.existsSync(assetsSource)) {
        copyFolderSync(assetsSource, assetsTarget, ['scss']);
        console.log(`   ✅ assets/ 폴더 복사 (scss 제외)`);
    }
    
    // theme 폴더 복사
    const themeSource = path.join(srcPath, 'theme');
    const themeTarget = path.join(docsDir, 'theme');
    if (fs.existsSync(themeSource)) {
        copyFolderSync(themeSource, themeTarget);
        console.log(`   ✅ theme/ 폴더 복사`);
    }
    
    // .nojekyll 파일 생성
    console.log('\n6️⃣  .nojekyll 파일 생성...');
    const nojekyllPath = path.join(docsDir, '.nojekyll');
    fs.writeFileSync(nojekyllPath, '');
    console.log(`   ✅ .nojekyll 파일 생성 완료`);

    console.log(`
    ╔═══════════════════════════════════════════════════════════╗
    ║                                                           ║
    ║   🎉 배포 준비 완료!                                      ║
    ║                                                           ║
    ║   다음 명령어로 GitHub에 푸시하세요:                      ║
    ║   git add docs && git commit -m "Deploy" && git push      ║
    ║                                                           ║
    ╚═══════════════════════════════════════════════════════════╝
    `);
}

// ============================================
// 메인 실행
// ============================================

const projectName = process.argv[2];
const subFolder = process.argv[3]; // 선택적: 하위 폴더 (없으면 sample)

if (!projectName) {
    console.error('❌ Error: 프로젝트 이름을 입력하세요.');
    console.log('\n사용법: npm run deploy [프로젝트명] [하위폴더(선택)]');
    console.log('\n예시:');
    console.log('  npm run deploy sustainability          → sustainability/sample');
    console.log('  npm run deploy ai-gate KR              → ai-gate/KR');
    console.log('  npm run deploy ai-gate UK/sample       → ai-gate/UK/sample');
    console.log('  npm run deploy ise2026-on-site         → ise2026-on-site/sample\n');
    process.exit(1);
}

// 배포 실행
deploy(projectName, subFolder);
