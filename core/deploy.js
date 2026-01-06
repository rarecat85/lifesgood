const fs = require('fs');
const path = require('path');

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
function copyFolderSync(source, target) {
    fs.mkdirSync(target, { recursive: true });

    const entries = fs.readdirSync(source, { withFileTypes: true });

    for (const entry of entries) {
        const sourcePath = path.join(source, entry.name);
        const targetPath = path.join(target, entry.name);

        if (entry.isDirectory()) {
            copyFolderSync(sourcePath, targetPath);
        } else {
            fs.copyFileSync(sourcePath, targetPath);
        }
    }
}

/**
 * 배포 실행 함수
 */
function deploy(projectName, subFolder) {
    const rootDir = path.join(__dirname, '..'); // 루트 디렉토리
    const projectDir = path.join(rootDir, projectName); // 프로젝트 디렉토리
    
    // 하위 폴더가 지정되면 해당 폴더 사용, 아니면 sample 폴더 사용
    const targetFolder = subFolder || 'sample';
    const sourceDir = path.join(projectDir, targetFolder); // 소스 폴더 경로
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
        
        // 프로젝트 내 폴더 목록 출력
        const folders = fs.readdirSync(projectDir, { withFileTypes: true })
            .filter(dirent => dirent.isDirectory())
            .map(dirent => dirent.name);
        folders.forEach(f => console.log(`   - ${f}`));
        
        process.exit(1);
    }

    console.log(`\n🚀 GitHub Pages 배포 시작...\n`);
    console.log(`📂 프로젝트: ${projectName}`);
    console.log(`📁 소스 폴더: ${targetFolder}`);
    console.log(`📁 전체 경로: ${sourceDir}`);
    console.log(`📁 대상: ${docsDir}\n`);

    // 1. docs 폴더 비우기
    console.log(`🗑️  docs 폴더 비우는 중...`);
    if (fs.existsSync(docsDir)) {
        emptyFolderSync(docsDir);
    } else {
        fs.mkdirSync(docsDir, { recursive: true });
    }
    console.log(`✅ docs 폴더 비우기 완료\n`);

    // 2. 소스 폴더를 docs로 복사
    console.log(`📋 파일 복사 중...`);
    copyFolderSync(sourceDir, docsDir);
    console.log(`✅ 파일 복사 완료\n`);

    // 3. .nojekyll 파일 생성 (GitHub Pages에서 Jekyll 처리 비활성화)
    const nojekyllPath = path.join(docsDir, '.nojekyll');
    fs.writeFileSync(nojekyllPath, '');
    console.log(`✅ .nojekyll 파일 생성 완료\n`);

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

// 명령줄 인자 받기
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
