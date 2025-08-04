# Life's Good 프로젝트를 위한 build system 

## system 설명
**SCSS 파일 컴파일**, **CSS Minify**, **Live Server 실행**을 포함하여 다양한 웹 개발 워크플로우를 지원합니다.  
또한, 빌드된 프로젝트를 특정 폴더에 복사하거나 템플릿 파일을 활용해 템플릿 HTML(또는 jsp)을 생성할 수 있습니다.

---

## 제공 구성 요소
### 기본 제공 파일 및 폴더
1. **`core/`**:
   - `dev.js`: SCSS 컴파일 및 Live Server 실행 스크립트.
   - `export.js`: 템플릿을 기반으로 HTML을 생성하는 스크립트.
   - `build.js`: 프로젝트 폴더를 복사하여 여러 환경을 설정하는 스크립트.
   - `component-dev.js`: 컴포넌트 기반 개발 환경을 제공하는 스크립트.
   - `component-build.js`: 컴포넌트를 통합하여 빌드하는 스크립트.
   - `copy.js`: HTML 파일에서 data-tp 속성을 추출하여 엑셀 파일로 생성하는 스크립트.
   - `change.js`: 엑셀 파일의 데이터를 기반으로 HTML 파일의 data-tp 속성을 업데이트하는 스크립트.
   - **`package.json`**: Core 디렉토리에서 사용되는 `npm` 패키지 관리 파일.

2. **`template/`**:
   - 템플릿 파일들이 위치한 폴더.
   - 예: `KR.jsp`, `LG5.jsp`, `AEM.html` 등.

3. **`README.md`**:
   - 프로젝트 사용 설명서.

---

## 프로젝트 생성 및 설정
### 프로젝트 폴더 생성
사용자는 `프로젝트명1`, `프로젝트명2`와 같은 사용자 정의 프로젝트 폴더를 생성하여 사용합니다.

### 프로젝트 폴더 구조
사용자가 생성한 프로젝트 폴더는 아래와 같은 구조를 따라야 합니다:   

```plaintext
project/
├── core/                   # 기본 제공 폴더
├── template/               # 기본 제공 템플릿 폴더
├── lifesgood2024_gate/     # 사용자 정의 프로젝트 폴더
│   ├── package.json        # 사용자 정의 프로젝트 전용 package.json
│   ├── sample
│   │   ├── common/             # 변환되지 않고 단순 복사할 파일
│   │   │   ├── font/           # font 폴더 (sample 화면을 볼 때 사용)
│   │   │   ├── js/             # 공통 js 폴더
│   │   │   ├── css/            # 공통 css 폴더
│   │   ├── src/                # 소스 코드 폴더
│   │   │   ├── index.html      # Live Server에서 사용할 HTML 파일
│   │   │   ├── components/     # 컴포넌트 폴더 (컴포넌트 기반 개발시 사용)
│   │   │   │   ├── header/     # 헤더 컴포넌트 예시
│   │   │   │   │   ├── header.html
│   │   │   │   │   ├── header.scss
│   │   │   │   ├── footer/     # 푸터 컴포넌트 예시 
│   │   │   │   │   ├── footer.html
│   │   │   │   │   ├── footer.scss
│   │   │   ├── assets/
│   │   │   │   ├── scss/       # SCSS 파일 폴더
│   │   │   │   └── style.scss
│   │   │   ├── img/        # img 파일 폴더
│   │   │   ├── css/        # 변환된 CSS 파일 폴더
│   │   │   └── js/         # JavaScript 파일 폴더
└── README.md
```

---
   
## core폴더에는 아래 패키지를 필수로 설치하여야 합니다.   
   
`sass`, `clean-css`, `live-server`, `jsdom`, `exceljs`   
```
npm install sass clean-css live-server jsdom exceljs   
```   
**패키지 설명:**
- **sass**: SCSS 파일을 CSS로 컴파일합니다.
- **clean-css**: CSS 파일을 최소화(minify)합니다.
- **live-server**: 실시간 변경감지 기능이 있는 로컬 개발 서버를 제공합니다.
- **jsdom**: HTML 파일을 파싱하고 조작하기 위한 라이브러리입니다.
- **exceljs**: Excel 파일을 읽고 쓰기 위한 라이브러리입니다.


---

## 사용자가 생성한 프로젝트 폴더에는 다음과 같은 package.json이 반드시 포함되어야 합니다.

~~~
{
  "name": "test1",      //생성한 프로젝트명
  "version": "1.0.0",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "dev": "node ../core/dev.js",
    "build": "node ../core/build.js",
    "export": "node ../core/export.js",
    "component-dev": "node ../core/component-dev.js",
    "component-build": "node ../core/component-build.js",
    "copy": "node ../core/copy.js",
    "change": "node ../core/change.js"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "description": ""
}
~~~

---

## 명령어 안내

명령어는 반드시 프로젝트 폴더 안에서 실행합니다.

```
cd <프로젝트명>
```

1. liveServer
    ```
    npm run dev -- <폴더명>
    ```
    * 프로젝트 내 sample 또는, 국가별 확장한 폴더명을 입력 시 해당 화면을 보며 작업할 수 있습니다.
    * 최초 작업시에는 sample 폴더를 구성하여 작업합니다.
    * sample 폴더를 기준으로 아래와 같이 실행할 수 있습니다.
    ```
    npm run dev -- sample
    ```
    * 이후 sample 폴더의 src내 scss 변환 자동감지하여 css 업데이트 및 live-server 자동 반영됩니다.
    * 변환된 css는 minify 되어 있습니다.

2. build
    ```
    npm run build -- <폴더명1> <폴더명2> ...
    ```
    * sample폴더 작업 후 확산할 국가명을 입력하면 해당 국가코드를 폴더명으로 한 폴더가 생성됩니다.
    * KR, US, UK 등을 생성할 경우 아래와 같이 실행할 수 있습니다.
    ```
    npm run build -- KR US UK
    ```
    * 실행 결과
    프로젝트 폴더 내 sample과 동일한 경로에 KR/ US/ UK/ 가 생성되며, common 및 src가 모두 복사됩니다.
    * 마찬가지로 각 폴더별 liveServer를 돌려볼 수 있습니다.
    * 각 폴더에서 국가별 커스터마이징 또는 언어 베리 작업을 진행합니다.

3. export
    ```
    npm run export -- <폴더명> <템플릿명>
    ```
    * 국가별 커스터마이징 또는 언어 베리를 마친 후 export 시 원하는 템플릿으로 생성됩니다. (단, 변환된 템플릿 파일 명은 프로젝트 명으로 생성)
    * KR 폴더에서 커스텀이 끝난 파일을 KR.jsp 템플릿을 이용해 export 시 아래와 같이 입력합니다. (확장자 생략)
    ```
    npm run export -- KR KR
    ```
    * 프로젝트 하위에 KR폴더 아래 프로젝트명.jsp 가 생성됩니다.

4. 컴포넌트 기반 개발 (Component-Dev)
    ```
    npm run component-dev -- <폴더명>
    ```
    * 컴포넌트 기반 개발 환경을 시작합니다.
    * src/components/ 폴더 내 각 컴포넌트의 HTML과 SCSS를 자동으로 병합합니다.
    * index.html 파일에서 {{컴포넌트명}} 형태로 작성된 태그를 해당 컴포넌트의 내용으로 대체합니다.
    * 예: index.html에 `{{header}}` 태그가 있다면 이를 components/header/header.html의 내용으로 대체합니다.
    * 컴포넌트 SCSS 파일은 메인 CSS 파일에 자동으로 병합되어 추가됩니다.
    * **컴포넌트 호출 여부에 따른 HTML 처리**
      * 컴포넌트 호출이 있는 경우: main.html 파일이 생성되고 라이브 서버는 main.html을 실행합니다.
      * 컴포넌트 호출이 없는 경우: main.html이 생성되지 않고 index.html을 직접 사용합니다.
    * 예시 실행:
    ```
    npm run component-dev -- sample
    ```

5. 컴포넌트 기반 빌드 (Component-Build)
    ```
    npm run component-build -- <폴더명1> <폴더명2> ...
    ```
    * component-dev로 생성된 main.html 파일을 기반으로 국가별 폴더를 생성합니다.
    * 생성된 폴더에는 main.html이 index.html로 복사되며, 다음 항목들이 포함됩니다:
      * assets 폴더: CSS, JS, 이미지 등
      * common 폴더: 공통 파일 (있는 경우)
      * components 폴더: 컴포넌트의 SCSS 파일들 (원본 폴더 구조 유지)
    * 컴포넌트 스타일은 CSS 파일에 이미 병합되어 있습니다.
    * 예시 실행:
    ```
    npm run component-build -- KR UK US
    ```
    * 실행 결과: 프로젝트 폴더 내에 KR, UK, US 폴더가 생성됩니다.
    * 생성된 폴더에서도 `npm run component-dev -- KR`과 같이 개발 서버를 실행할 수 있습니다.

6. copy (데이터 추출)
    ```
    npm run copy -- <폴더명>
    ```
    * HTML 파일에서 `data-tp` 속성을 가진 요소들을 추출하여 엑셀 파일로 생성합니다.
    * 지원하는 data-tp 타입: `label`, `copy`, `alt`, `link`
    * 추출된 데이터는 `copy.xlsx` 파일로 저장됩니다.
    * 예시 실행:
    ```
    npm run copy -- sample
    ```
    * 실행 결과: 프로젝트 루트에 `copy.xlsx` 파일이 생성됩니다.

7. change (데이터 적용)
    ```
    npm run change -- <폴더명>
    ```
    * `copy.xlsx` 파일의 데이터를 기반으로 HTML 파일의 `data-tp` 속성을 업데이트합니다.
    * 원본 파일은 `.backup` 확장자로 백업됩니다.
    * 예시 실행:
    ```
    npm run change -- MX
    ```
    * 실행 결과: 해당 폴더의 `src/index.html` 파일이 업데이트되고 백업 파일이 생성됩니다.

---

## 컴포넌트 기반 개발 주의사항

1. **컴포넌트 구조**: 각 컴포넌트는 src/components/ 폴더 내에 자체 폴더를 가져야 하며, 컴포넌트와 동일한 이름의 HTML 파일과 SCSS 파일을 포함해야 합니다.
   
2. **컴포넌트 참조**: index.html 파일에서 컴포넌트를 참조할 때는 `{{컴포넌트명}}` 형식으로 작성합니다.

3. **경로 참조**: 컴포넌트 내에서 assets 폴더를 참조할 때는 상대 경로를 사용합니다. 시스템이 자동으로 경로를 조정합니다.

4. **CSS 병합**: 모든 컴포넌트의 SCSS 파일은 자동으로 메인 CSS 파일에 병합됩니다. 별도의 link 태그를 추가할 필요가 없습니다.

5. **컴포넌트 호출 감지**: 
   - index.html에 `{{컴포넌트명}}` 형태의 호출이 있으면 main.html이 생성되고 main.html로 라이브 서버가 실행됩니다.
   - 컴포넌트 호출이 없으면 index.html 파일을 그대로 사용하고 main.html은 생성되지 않습니다.
   - 이를 통해 component-build로 생성된 폴더에서도 component-dev를 문제없이 사용할 수 있습니다.

6. **작업 순서**: 
   - 먼저 샘플 폴더에서 컴포넌트 개발 작업을 진행합니다. (`npm run component-dev -- sample`)
   - 개발이 완료되면 component-build를 실행하여 국가별 폴더를 생성합니다. (`npm run component-build -- KR UK US`)
   - 각 국가별 폴더에서 필요한 커스터마이징을 진행합니다.
   - 국가별 폴더에서도 component-dev를 실행하여 개발할 수 있습니다.
   - 모든 작업이 완료되면 export.js를 실행하여 템플릿에 적용합니다. (`npm run export -- KR KR`)
   - export.js는 컴포넌트 기반으로 통합된 HTML을 템플릿에 삽입하여 최종 결과물을 생성합니다.
   - 컴포넌트 개발 → 빌드 → 커스터마이징 → 템플릿 적용의 전체 워크플로우를 지원합니다.

## 데이터 관리 기능 주의사항

1. **data-tp 속성 사용**: HTML 요소에 `data-tp` 속성을 추가하여 추출할 데이터를 지정합니다.
   - `data-tp="label"`: aria-label 속성 값을 추출/업데이트
   - `data-tp="copy"`: 요소의 텍스트 내용을 추출/업데이트
   - `data-tp="alt"`: alt 속성 값을 추출/업데이트
   - `data-tp="link"`: href 속성 값을 추출/업데이트

2. **copy 명령어 사용**: 
   - `npm run copy -- <폴더명>`으로 HTML에서 데이터를 추출합니다.
   - `src/main.html` 파일의 `data-tp` 속성을 가진 요소들을 찾아 엑셀 파일로 생성합니다.
   - 생성된 `copy.xlsx` 파일을 편집하여 번역이나 수정 작업을 진행합니다.

3. **change 명령어 사용**:
   - `npm run change -- <폴더명>`으로 엑셀 파일의 데이터를 HTML에 적용합니다.
   - `src/index.html` 파일의 `data-tp` 속성을 가진 요소들을 순서대로 업데이트합니다.
   - 원본 파일은 자동으로 `.backup` 확장자로 백업됩니다.

4. **작업 순서**:
   - HTML 파일에 `data-tp` 속성을 추가합니다.
   - `npm run copy -- sample`로 데이터를 추출합니다.
   - `copy.xlsx` 파일을 편집하여 번역이나 수정을 진행합니다.
   - `npm run change -- sample`로 수정된 데이터를 HTML에 적용합니다.
   - 필요시 다른 국가 폴더에도 동일한 과정을 적용합니다.