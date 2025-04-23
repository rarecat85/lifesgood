/* 레이어 컨텐츠 데이터 정의 */
// 미디어 경로 상수 정의 (여기만 변경해주세요.)
const IMAGE_PATH = './assets/images/';
const VIDEO_PATH = './assets/videos/';

// 스와이퍼 인스턴스 저장 변수
let thumbSwiper = null;
let contentSwiper = null;
// 현재 열린 레이어 타입 저장 변수
let currentLayerType = null;

const featuerList = {
  "layer-audio": {
    data: {
      1: {
        title: "AI Sound",
        subTitle: "AI perfects sound for every genre",
        description: "Choose manually from rhythm, melody, or voice-oriented modes based on your preference, or let AI set the most optimal mode for you. AI analyzes audio and adjusts the sound to suit the genre.",
        type: "image",
        mainImg: "ai-gate-image-product-category-audio-feature01-popup.png",
        thumbImg: "ai-gate-image-product-category-audio-feature01.png",
        imgAlt: "LG XBOOM speaker with AI sound modes including Bass Boost, Voice Enhance, and Standard",
      },
      2: {
        title: "AI Lighting",
        subTitle: 'AI lighting that syncs with sound',
        description: "AI detects genre of your music and delivers the optimal the lighting that syncs with sound. Choose from Ambient, Party, Voice mode to set the mood. Check the informative lighting for speaker's status.",
        type: "image",
        mainImg: "ai-gate-image-product-category-audio-feature02-popup.png",
        thumbImg: "ai-gate-image-product-category-audio-feature02.png",
        imgAlt: "LG XBOOM speaker with AI Lighting that adapts to voice, ambient, and party modes",
      },
      3: {
        title: "AI Calibration",
        subTitle: "AI calibration for space-filling sound",
        description: "AI calibrates audio based on the size and shape of the space you're in. Delivers full, undistorted sound whether in a spacious area or a small room.",
        type: "image",
        mainImg: "ai-gate-image-product-category-audio-feature03-popup.png",
        thumbImg: "ai-gate-image-product-category-audio-feature03.png",
        imgAlt: "LG XBOOM speaker placed on a table in a red-toned room with grid-patterned walls and modern furniture",
      }
    }
  },
  "layer-airconditioning": {
    data: {}
  },
  "layer-computing": {
    data: {}
  }
}

// 레이어 팝업 열기 함수
function openLayerPopup(layerType) {
  if (featuerList[layerType]) {
    console.log(`${layerType} 레이어 팝업이 열립니다:`, featuerList[layerType]);
    
    // 현재 레이어 타입 저장
    currentLayerType = layerType;
    
    const popupElement = document.querySelector('.products-layer');
    if (popupElement) {
      popupElement.setAttribute('aria-hidden', 'false');
      popupElement.classList.add('active');
      
      // 데이터 채우기 - 초기 데이터는 첫번째 항목(1)을 사용
      if (featuerList[layerType].data && Object.keys(featuerList[layerType].data).length > 0) {
        const initialData = featuerList[layerType].data[1];
        
        // 초기 데이터로 텍스트 내용 업데이트
        updateLayerContent(initialData);
        
        // 이미지 슬라이드 생성
        createContentSlides(layerType, popupElement);
        
        // 스와이퍼 초기화
        initSwipers();
      }
    }
  } else {
    console.warn(`${layerType} 레이어 데이터가 없습니다.`);
  }
}

// 레이어 콘텐츠 업데이트 함수
function updateLayerContent(data) {
  const popupElement = document.querySelector('.products-layer');
  if (!popupElement || !data) return;
  
  // title 설정
  const titleElement = popupElement.querySelector('.products-layer-header-title-bx-title');
  if (titleElement && data.title) {
    titleElement.textContent = data.title;
  }
  
  // subTitle 설정
  const subTitleElement = popupElement.querySelector('.products-layer-content-txtwrap-txtbx-title');
  if (subTitleElement && data.subTitle) {
    subTitleElement.textContent = data.subTitle;
  }
  
  // description 설정
  const descElement = popupElement.querySelector('.products-layer-content-txtwrap-txtbx-desc');
  if (descElement && data.description) {
    descElement.textContent = data.description;
  }
}

// 이미지 슬라이드 생성 함수
function createContentSlides(layerType, popupElement) {
  const dataItems = featuerList[layerType].data;
  const swiperWrapper = popupElement.querySelector('.products-layer-content-swiper-wrapper');
  
  // 기존 슬라이드 제거
  if (swiperWrapper) {
    swiperWrapper.innerHTML = '';
    
    // 각 데이터 항목에 대해 슬라이드 생성
    Object.keys(dataItems).forEach(key => {
      const item = dataItems[key];
      
      // 이미지 타입인 경우
      if (item.type === 'image') {
        const slide = document.createElement('div');
        slide.className = 'swiper-slide';
        
        const img = document.createElement('img');
        img.src = `${IMAGE_PATH}${item.mainImg}`;
        img.alt = item.imgAlt || '';
        
        slide.appendChild(img);
        swiperWrapper.appendChild(slide);
      }
      // 비디오 타입은 나중에 구현 예정
    });
    
    // 썸네일 슬라이드도 생성
    createThumbSlides(layerType, popupElement);
  }
}

// 썸네일 슬라이드 생성 함수
function createThumbSlides(layerType, popupElement) {
  const dataItems = featuerList[layerType].data;
  const thumbWrapper = popupElement.querySelector('.products-layer-content-thumb-swiper-wrapper');
  
  // 기존 썸네일 제거
  if (thumbWrapper) {
    thumbWrapper.innerHTML = '';
    
    // 각 데이터 항목에 대해 썸네일 슬라이드 생성
    Object.keys(dataItems).forEach(key => {
      const item = dataItems[key];
      
      const thumbSlide = document.createElement('div');
      thumbSlide.className = 'swiper-slide';
      
      if (item.type === 'image') {
        const thumbImg = document.createElement('img');
        thumbImg.src = `${IMAGE_PATH}${item.thumbImg}`;
        thumbImg.alt = `.${item.imgAlt}`;
        
        thumbSlide.appendChild(thumbImg);
        thumbWrapper.appendChild(thumbSlide);
      }
    });
  }
}

// 스와이퍼 초기화 함수
function initSwipers() {
  // 기존 스와이퍼 제거
  if (thumbSwiper) {
    thumbSwiper.destroy();
  }
  if (contentSwiper) {
    contentSwiper.destroy();
  }
  
  // 썸네일 스와이퍼 초기화
  thumbSwiper = new Swiper('.products-layer-content-thumb-swiper', {
    slidesPerView: 'auto',
    spaceBetween: 12,
    freeMode: true,
    watchSlidesProgress: true,
    navigation: {
      nextEl: '.products-layer-content-thumb-swiper-btn-next',
      prevEl: '.products-layer-content-thumb-swiper-btn-prev',
    },
    breakpoints: {
      768: {
        spaceBetween: 16,
      },
    },
  });

  // 메인 콘텐츠 스와이퍼 초기화
  contentSwiper = new Swiper('.products-layer-content-swiper', {
    slidesPerView: 1,
    spaceBetween: 0,
    navigation: false,
    thumbs: {
      swiper: thumbSwiper,
    },
    on: {
      slideChange: function() {
        // 슬라이드 변경 시 콘텐츠 업데이트
        if (currentLayerType && featuerList[currentLayerType]) {
          // 스와이퍼 인덱스는 0부터 시작, 데이터 인덱스는 1부터 시작이므로 +1 해줌
          const slideIndex = this.activeIndex + 1;
          const slideData = featuerList[currentLayerType].data[slideIndex];
          
          if (slideData) {
            updateLayerContent(slideData);
          }
        }
      }
    }
  });
}

// 레이어 팝업 닫기 함수
function closeLayerPopup() {
  const popupElement = document.querySelector('.products-layer');
  if (popupElement) {
    popupElement.setAttribute('aria-hidden', 'true');
    popupElement.classList.remove('active');
  }
}

// 레이어 버튼 이벤트 핸들러
function handleLayerButtonClick(event) {
  // 기본 이벤트(하이퍼링크 이동) 방지
  event.preventDefault();
  
  const button = event.currentTarget;
  const classList = button.classList;
  
  // layer-audio, layer-airconditioning, layer-computing 등의 클래스 감지
  const layerTypes = ['layer-audio', 'layer-airconditioning', 'layer-computing'];
  
  for (const layerType of layerTypes) {
    if (classList.contains(layerType)) {
      openLayerPopup(layerType);
      return;
    }
  }
}

// 문서 로드 후 이벤트 리스너 설정
document.addEventListener('DOMContentLoaded', function() {
  // 레이어 열기 버튼에 이벤트 리스너 추가
  const layerButtons = document.querySelectorAll('.layer-open');
  layerButtons.forEach(button => {
    button.addEventListener('click', handleLayerButtonClick);
  });
  
  // 레이어 닫기 버튼에 이벤트 리스너 추가
  const closeButton = document.querySelector('.products-layer-header-close');
  if (closeButton) {
    closeButton.addEventListener('click', closeLayerPopup);
  }
});