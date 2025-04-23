/* 레이어 컨텐츠 데이터 정의 */
// 미디어 경로 상수 정의 (여기만 변경해주세요.)
const IMAGE_PATH = './assets/images/';
const VIDEO_PATH = './assets/videos/';

// 스와이퍼 인스턴스 저장 변수
let thumbSwiper = null;
let contentSwiper = null;
// 현재 열린 레이어 타입 저장 변수
let currentLayerType = null;
// 포커스 트랩 변수
let lastFocusedElementBeforePopup = null;

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
  "layer-conditioning": {
    data: {
      1: {
        title: "AI Air",
        subTitle: "adapts intelligently to keep you comfortable",
        description: "Experience optimal comfort as AI Air continuously adjusts airflow based on your location, using radar sensors for smart detection.",
        type: "video",
        mainVideo: "ai-gate-video-product-category-air-conditioning-feature01-popup.mp4",
        thumbImg: "ai-gate-image-product-category-air-conditioning-feature01.png",
        imgAlt: "Woman relaxing in a smart living room while LG AI Air conditioner automatically adjusts temperature, airflow, and humidity",
      },
      2: {
        title: "AI kW Manager",
        subTitle: "optimizes energy use without compromising comfort",
        description: "Stay cool and in control—kW Manager helps you manage energy usage and spending efficiently, all while keeping your comfort a priority.",
        type: "video",
        mainVideo: "ai-gate-video-product-category-air-conditioning-feature02-popup.mp4",
        thumbImg: "ai-gate-image-product-category-air-conditioning-feature01.png",
        imgAlt: "Smartphone interface showing energy consumption graph in front of LG air conditioner, highlighting AI kW Manager for efficient power monitoring",
      }
    }
  },
  "layer-computing": {
    data: {
      1: {
        title: "gram Chat On-Device",
        subTitle: "supports your work seamlessly—anytime, offline",
        description: "Boost your productivity with on-device AI that helps you catch what you missed and provides instant summaries—no internet required.",
        type: "video",
        mainVideo: "ai-gate-video-product-category-computing-feature01-popup.mp4",
        thumbImg: "ai-gate-image-product-category-computing-feature01.png",
        imgAlt: "LG gram laptop featuring On-Device AI with smart assistant interface on screen",
      },
      2: {
        title: "gram Chat Cloud",
        subTitle: "powers smarter support for online tasks and research",
        description: "Unlock your potential with your go-to conversational assistant, delivering relevant knowledge and insights directly from the web.",
        type: "video",
        mainVideo: "ai-gate-video-product-category-computing-feature02-popup.mp4",
        thumbImg: "ai-gate-image-product-category-computing-feature02.png",
        imgAlt: "LG gram laptop with Cloud AI displaying smart assistant interface for online support and productivity",
      },
    }
  }
}

// 레이어 팝업 열기 함수
function openLayerPopup(layerType) {
  if (featuerList[layerType]) {
    console.log(`${layerType} 레이어 팝업이 열립니다:`, featuerList[layerType]);
    
    // 현재 레이어 타입 저장
    currentLayerType = layerType;
    
    // 현재 포커스된 요소 저장 (팝업 닫을 때 포커스 복원용)
    lastFocusedElementBeforePopup = document.activeElement;
    
    const popupElement = document.querySelector('.products-layer');
    if (popupElement) {
      popupElement.setAttribute('aria-hidden', 'false');
      popupElement.classList.add('active');
      
      // body에 noscroll 클래스 추가
      document.body.classList.add('noscroll');
      
      // 데이터 채우기 - 초기 데이터는 첫번째 항목(1)을 사용
      if (featuerList[layerType].data && Object.keys(featuerList[layerType].data).length > 0) {
        const initialData = featuerList[layerType].data[1];
        
        // 초기 데이터로 텍스트 내용 업데이트
        updateLayerContent(initialData);
        
        // 이미지 슬라이드 생성
        createContentSlides(layerType, popupElement);
        
        // 스와이퍼 초기화
        initSwipers();
        
        // 포커스 트랩 설정 (다음 프레임에서 실행하여 DOM 업데이트 후 포커스 적용)
        setTimeout(() => {
          // 팝업 내 첫 번째 포커스 가능한 요소로 포커스 이동
          const firstFocusableElement = getFocusableElements(popupElement)[0];
          if (firstFocusableElement) {
            firstFocusableElement.focus();
          } else {
            // 포커스 가능한 요소가 없으면 팝업 자체에 포커스
            popupElement.setAttribute('tabindex', '-1');
            popupElement.focus();
          }
        }, 100);
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
      const slide = document.createElement('div');
      slide.className = 'swiper-slide';
      
      // 이미지 타입인 경우
      if (item.type === 'image') {
        const img = document.createElement('img');
        img.src = `${IMAGE_PATH}${item.mainImg}`;
        img.alt = item.imgAlt || '';
        
        slide.appendChild(img);
      }
      // 비디오 타입인 경우
      else if (item.type === 'video') {
        const video = document.createElement('video');
        video.src = `${VIDEO_PATH}${item.mainVideo}`;
        video.controls = true;
        video.playsInline = true;
        video.muted = true;
        video.autoplay = true;
        video.loop = true;
        video.preload = 'metadata';
        
        // 비디오의 설명 추가
        if (item.imgAlt) {
          video.setAttribute('aria-label', item.imgAlt);
        }
        
        slide.appendChild(video);
      }
      
      swiperWrapper.appendChild(slide);
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
      
      // 이미지와 비디오 모두 썸네일은 이미지로 표시
      const thumbImg = document.createElement('img');
      thumbImg.src = `${IMAGE_PATH}${item.thumbImg}`;
      thumbImg.alt = item.imgAlt || '';
      
      thumbSlide.appendChild(thumbImg);
      thumbWrapper.appendChild(thumbSlide);
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
          
          // 모든 비디오 초기화
          resetAllVideos();
          
          // 현재 활성화된 슬라이드의 비디오가 있으면 자동 재생
          const activeSlide = this.slides[this.activeIndex];
          if (activeSlide) {
            const video = activeSlide.querySelector('video');
            if (video) {
              video.currentTime = 0;
              video.play().catch(e => console.log('비디오 자동 재생 실패:', e));
            }
          }
        }
      }
    }
  });
}

// 모든 비디오 초기화 함수
function resetAllVideos() {
  const videos = document.querySelectorAll('.products-layer-content-swiper video');
  videos.forEach(video => {
    video.pause();
    video.currentTime = 0;
  });
}

// 레이어 팝업 내 포커스 가능한 요소 가져오기
function getFocusableElements(container) {
  // 포커스 가능한 요소 선택자
  const focusableSelectors = 'button, [href], input, select, textarea, [tabindex]:not([tabindex="-1"])';
  // 컨테이너 내부에서 포커스 가능한 요소 모두 가져오기
  const elements = container.querySelectorAll(focusableSelectors);
  // 실제 보이는 요소만 필터링
  return Array.from(elements).filter(el => {
    return el.offsetWidth > 0 && el.offsetHeight > 0 && !el.disabled;
  });
}

// 레이어 팝업 닫기 함수
function closeLayerPopup() {
  const popupElement = document.querySelector('.products-layer');
  if (popupElement) {
    popupElement.setAttribute('aria-hidden', 'true');
    popupElement.classList.remove('active');
    
    // body에서 noscroll 클래스 제거
    document.body.classList.remove('noscroll');
    
    // 이전에 포커스되었던 요소로 포커스 복원
    if (lastFocusedElementBeforePopup) {
      lastFocusedElementBeforePopup.focus();
    }
  }
}

// 레이어 버튼 이벤트 핸들러
function handleLayerButtonClick(event) {
  // 기본 이벤트(하이퍼링크 이동) 방지
  event.preventDefault();
  
  const button = event.currentTarget;
  const classList = button.classList;
  
  // layer-audio, layer-airconditioning, layer-computing 등의 클래스 감지
  const layerTypes = ['layer-audio', 'layer-conditioning', 'layer-computing'];
  
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
  
  // 레이어 배경 클릭 시 팝업 닫기
  const productsLayer = document.querySelector('.products-layer');
  if (productsLayer) {
    productsLayer.addEventListener('click', function(event) {
      // 클릭된 요소가 products-layer 자체인 경우에만 닫기
      // (내부 컨텐츠 영역 클릭은 무시)
      if (event.target === this) {
        closeLayerPopup();
      }
    });
  }
  
  // ESC 키를 눌렀을 때 팝업 닫기
  document.addEventListener('keydown', function(event) {
    // ESC 키의 keyCode는 27
    if (event.key === 'Escape' || event.keyCode === 27) {
      // 팝업이 현재 열려있는지 확인
      const popup = document.querySelector('.products-layer.active');
      if (popup) {
        closeLayerPopup();
      }
    }
    
    // 팝업이 열려있을 때 Tab 키 포커스 제어
    if ((event.key === 'Tab' || event.keyCode === 9) && document.querySelector('.products-layer.active')) {
      const popup = document.querySelector('.products-layer.active');
      const focusableElements = getFocusableElements(popup);
      
      if (focusableElements.length === 0) return;
      
      const firstElement = focusableElements[0];
      const lastElement = focusableElements[focusableElements.length - 1];
      
      // Shift+Tab 클릭 시 (역방향 탐색)
      if (event.shiftKey) {
        // 현재 포커스가 첫 번째 요소에 있으면 마지막 요소로 포커스 이동
        if (document.activeElement === firstElement) {
          lastElement.focus();
          event.preventDefault();
        }
      } 
      // Tab 클릭 시 (정방향 탐색)
      else {
        // 현재 포커스가 마지막 요소에 있으면 첫 번째 요소로 포커스 이동
        if (document.activeElement === lastElement) {
          firstElement.focus();
          event.preventDefault();
        }
      }
    }
  });
});