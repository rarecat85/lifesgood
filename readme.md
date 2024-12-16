# Life's Good 프로젝트를 위한 build sistem 

## sistem 설명
**SCSS 파일 컴파일**, **CSS Minify**, **Live Server 실행**을 포함하여 다양한 웹 개발 워크플로우를 지원합니다.  
또한, 빌드된 프로젝트를 특정 폴더에 복사하거나 템플릿 파일을 활용해 템플릿 HTML(또는 jsp)을 생성할 수 있습니다.

---

## 제공 구성 요소
### 기본 제공 파일 및 폴더
1. **`core/`**:
   - `dev.js`: SCSS 컴파일 및 Live Server 실행 스크립트.
   - `export.js`: 템플릿을 기반으로 HTML을 생성하는 스크립트.
   - `build.js`: 프로젝트 폴더를 복사하여 여러 환경을 설정하는 스크립트.
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
│   ├── common/             # 변환되지 않고 단순 복사할 파일
│   │   ├── font/           # font 폴더 (sample 화면을 볼 때 사용)
│   │   ├── js/             # 공통 js 폴더
│   │   ├── css/            # 공통 css 폴더
│   ├── src/                # 소스 코드 폴더
│   │   ├── index.html      # Live Server에서 사용할 HTML 파일
│   │   ├── assets/
│   │   │   ├── scss/       # SCSS 파일 폴더
│   │   │   │   └── style.scss
│   │   │   ├── img/        # img 파일 폴더
│   │   │   ├── css/        # 변환된 CSS 파일 폴더
│   │   │   └── js/         # JavaScript 파일 폴더
└── README.md
```

---
   
## core폴더에는 아래 패키지를 필수로 설치하여야 합니다.   
   
`sass`, `clean-css`, `live-server`   
```
npm install sass clean-css live-server   
```   


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
    "export": "node ../core/export.js"
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