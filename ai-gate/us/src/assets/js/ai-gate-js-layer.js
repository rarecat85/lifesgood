/* 레이어 컨텐츠 데이터 정의 */
const IMAGE_PATH = './assets/image/';

let thumbSwiper = null;
let contentSwiper = null;
let currentLayerType = null;
let lastFocusedElementBeforePopup = null;

function setScrollbarWidthProperty() {
  const scrollbarWidth = window.innerWidth - document.documentElement.clientWidth;
  document.documentElement.style.setProperty('--scrollbar-width', scrollbarWidth + 'px');
}

const featuerList = {
  "layer-audio": {
    data: {
      1: {
        title: "AI Sound",
        subTitle: "refines your listening with sound tuned to every genre by AI",
        description: "Choose manually from rhythm, melody, or voice-oriented modes based on your preference, or let AI set the most optimal mode for you. AI analyzes audio and adjusts the sound to suit the genre.",
        type: "image",
        mainImg: "ai-gate-image-product-category-audio-feature01.png",
        thumbImg: "ai-gate-image-product-category-audio-feature01.png",
        imgAlt: "AI Sound automatically analyzes incoming audio and adjusts EQ in real time — emphasizing rhythm, melody, or vocals based on genre. Choose modes like Bass Boost, Voice Enhance, or Standard manually, or let AI select the optimal mode for whatever you're playing.",
      },
      2: {
        title: "AI Lighting",
        subTitle: "creates the right vibe by syncing with every sound—powered by AI",
        description: "Experience AI match your music with lighting that syncs perfectly to the sound. Choose from Ambient, Party, or Voice mode to set the mood, with real-time lighting that reflects your speaker's status.",
        type: "image",
        mainImg: "ai-gate-image-product-category-audio-feature02.png",
        thumbImg: "ai-gate-image-product-category-audio-feature02.png",
        imgAlt: "LG xboom AI speaker with AI Lighting LEDs glowing in different modes: Voice mode highlighting vocal frequencies, Ambient for relaxed listening, and Party for dynamic gatherings.",
      },
      3: {
        title: "AI Sound Pro+",
        subTitle: "fills the room with richer, more immersive audio",
        description: "AI Sound Pro+ analyzes your content in real time and upmixes audio to deliver rich, immersive sound—whether you're watching a movie or playing music.",
        type: "image",
        mainImg: "ai-gate-image-product-category-audio-feature03.png",
        thumbImg: "ai-gate-image-product-category-audio-feature03.png",
        imgAlt: "A soundbar emitting rich, immersive sound wave patterns from its top and bottom.",
      }
    }
  },
  "layer-conditioning": {
    data: {
      1: {
        title: "AI Air",
        subTitle: "adapts intelligently to keep you comfortable",
        description: "Experience optimal comfort as AI Air continuously adjusts airflow based on your location, using radar sensors for smart detection.",
        type: "image",
        mainImg: "ai-gate-image-product-category-air-conditioning-feature01.png",
        thumbImg: "ai-gate-image-product-category-air-conditioning-feature01.png",
        imgAlt: "Woman relaxing in a smart living room while the LG DUALCOOL AI air conditioner automatically adjusts temperature, airflow, and humidity — its radar sensor detecting her position to deliver personalized indirect cooling.",
      },
      2: {
        title: "AI DUAL Inverter",
        subTitle: "keeps cooling efficient without sacrificing comfort",
        description: "AI DUAL Inverter automatically adjusts compressor speed to maintain your preferred temperature while using energy more efficiently.",
        type: "image",
        mainImg: "ai-gate-image-product-category-air-conditioning-feature02.png",
        thumbImg: "ai-gate-image-product-category-air-conditioning-feature02.png",
        imgAlt: "A wall-mounted air conditioner operating in a living room, gently circulating airflow.",
      },
      3: {
        title: "AI Freeze Cleaning",
        subTitle: "helps keep cooling performance consistent",
        description: "AI Freeze Cleaning uses a freeze-and-melt cycle to help remove dust from the heat exchanger, keeping airflow clean and cooling performance consistent.",
        type: "image",
        mainImg: "ai-gate-image-product-category-air-conditioning-feature03.png",
        thumbImg: "ai-gate-image-product-category-air-conditioning-feature03.png",
        imgAlt: "A wall-mounted air conditioner blowing a wide, powerful stream of cool air downward.",
      }
    }
  },
  "layer-computing": {
    data: {
      1: {
        title: "gram Chat On-Device",
        subTitle: "supports your work seamlessly—anytime, offline",
        description: "Boost your productivity with on-device AI that helps you catch what you missed and provides instant summaries—no internet required.",
        type: "image",
        mainImg: "ai-gate-image-product-category-computing-feature01.png",
        thumbImg: "ai-gate-image-product-category-computing-feature01.png",
        imgAlt: "LG gram AI laptop displaying the gram chat On-Device interface, a privacy-first smart assistant that runs locally on LG's EXAONE model for secure offline file search and summarization.",
      },
      2: {
        title: "gram Chat Cloud",
        subTitle: "powers smarter support for online tasks and research",
        description: "Unlock your potential with your go-to conversational assistant, delivering relevant knowledge and insights directly from the web.",
        type: "image",
        mainImg: "ai-gate-image-product-category-computing-feature02.png",
        thumbImg: "ai-gate-image-product-category-computing-feature02.png",
        imgAlt: "LG gram AI laptop displaying the gram chat Cloud interface, powered by GPT-4o, a smart assistant that handles complex online research, multi-document synthesis, and creative tasks for boosted productivity.",
      },
    }
  }
}

function openLayerPopup(layerType) {
  if (!featuerList[layerType]) {
    return;
  }

  currentLayerType = layerType;
  lastFocusedElementBeforePopup = document.activeElement;

  const popupElement = document.querySelector('.products-layer');
  if (!popupElement) {
    return;
  }

  popupElement.setAttribute('aria-hidden', 'false');
  popupElement.classList.add('active');

  setScrollbarWidthProperty();
  document.body.classList.add('noscroll');

  if (featuerList[layerType].data && Object.keys(featuerList[layerType].data).length > 0) {
    const initialData = featuerList[layerType].data[1];
    updateLayerContent(initialData);
    createContentSlides(layerType, popupElement);
    initSwipers();

    setTimeout(() => {
      const firstFocusableElement = getFocusableElements(popupElement)[0];
      if (firstFocusableElement) {
        firstFocusableElement.focus();
      } else {
        popupElement.setAttribute('tabindex', '-1');
        popupElement.focus();
      }
    }, 100);
  }
}

function updateLayerContent(data) {
  const popupElement = document.querySelector('.products-layer');
  if (!popupElement || !data) return;

  const titleElement = popupElement.querySelector('.products-layer-header-title-bx-title');
  if (titleElement && data.title) {
    titleElement.textContent = data.title;
  }

  const subTitleElement = popupElement.querySelector('.products-layer-content-txtwrap-txtbx-title');
  if (subTitleElement && data.subTitle) {
    subTitleElement.textContent = data.subTitle;
  }

  const descElement = popupElement.querySelector('.products-layer-content-txtwrap-txtbx-desc');
  if (descElement && data.description) {
    descElement.textContent = data.description;
  }
}

function createContentSlides(layerType, popupElement) {
  const dataItems = featuerList[layerType].data;
  const swiperWrapper = popupElement.querySelector('.products-layer-content-swiper-wrapper');

  if (swiperWrapper) {
    swiperWrapper.innerHTML = '';

    Object.keys(dataItems).forEach(key => {
      const item = dataItems[key];
      const slide = document.createElement('div');
      slide.className = 'swiper-slide';

      const slideBackground = document.createElement('div');
      slideBackground.classList.add('slide-bg');
      slideBackground.style.backgroundImage = `url(${IMAGE_PATH}${item.thumbImg})`;
      slide.append(slideBackground);

      const img = document.createElement('img');
      img.src = `${IMAGE_PATH}${item.mainImg}`;
      img.alt = item.imgAlt || '';
      slide.appendChild(img);

      swiperWrapper.appendChild(slide);
    });

    createThumbSlides(layerType, popupElement);
  }
}

function createThumbSlides(layerType, popupElement) {
  const dataItems = featuerList[layerType].data;
  const thumbWrapper = popupElement.querySelector('.products-layer-content-thumb-swiper-wrapper');

  if (thumbWrapper) {
    thumbWrapper.innerHTML = '';

    Object.keys(dataItems).forEach(key => {
      const item = dataItems[key];
      const thumbSlide = document.createElement('div');
      thumbSlide.className = 'swiper-slide';

      const thumbImg = document.createElement('img');
      thumbImg.src = `${IMAGE_PATH}${item.thumbImg}`;
      thumbImg.alt = item.imgAlt || '';

      thumbSlide.appendChild(thumbImg);
      thumbWrapper.appendChild(thumbSlide);
    });
  }
}

function initSwipers() {
  if (thumbSwiper) {
    thumbSwiper.destroy();
  }
  if (contentSwiper) {
    contentSwiper.destroy();
  }

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

  contentSwiper = new Swiper('.products-layer-content-swiper', {
    slidesPerView: 1,
    spaceBetween: 0,
    navigation: false,
    thumbs: {
      swiper: thumbSwiper,
    },
    on: {
      slideChange: function() {
        if (currentLayerType && featuerList[currentLayerType]) {
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

function getFocusableElements(container) {
  const focusableSelectors = 'button, [href], input, select, textarea, [tabindex]:not([tabindex="-1"])';
  const elements = container.querySelectorAll(focusableSelectors);
  return Array.from(elements).filter(el => {
    return el.offsetWidth > 0 && el.offsetHeight > 0 && !el.disabled;
  });
}

function closeLayerPopup() {
  const popupElement = document.querySelector('.products-layer');
  if (popupElement) {
    popupElement.setAttribute('aria-hidden', 'true');
    popupElement.classList.remove('active');
    document.body.classList.remove('noscroll');

    if (lastFocusedElementBeforePopup) {
      lastFocusedElementBeforePopup.focus();
    }
  }
}

function handleLayerButtonClick(event) {
  const button = event.currentTarget;
  const classList = button.classList;
  const layerTypes = ['layer-audio', 'layer-conditioning', 'layer-computing'];

  for (const layerType of layerTypes) {
    if (classList.contains(layerType) && featuerList[layerType]) {
      event.preventDefault();
      openLayerPopup(layerType);
      return;
    }
  }
}

document.addEventListener('DOMContentLoaded', function() {
  setScrollbarWidthProperty();
  window.addEventListener('resize', setScrollbarWidthProperty);

  const layerButtons = document.querySelectorAll('.layer-open');
  layerButtons.forEach(button => {
    button.addEventListener('click', handleLayerButtonClick);
  });

  const closeButton = document.querySelector('.products-layer-header-close');
  if (closeButton) {
    closeButton.addEventListener('click', closeLayerPopup);
  }

  const productsLayer = document.querySelector('.products-layer');
  if (productsLayer) {
    productsLayer.addEventListener('click', function(event) {
      if (event.target === this) {
        closeLayerPopup();
      }
    });
  }

  document.addEventListener('keydown', function(event) {
    if (event.key === 'Escape' || event.keyCode === 27) {
      const popup = document.querySelector('.products-layer.active');
      if (popup) {
        closeLayerPopup();
      }
    }

    if ((event.key === 'Tab' || event.keyCode === 9) && document.querySelector('.products-layer.active')) {
      const popup = document.querySelector('.products-layer.active');
      const focusableElements = getFocusableElements(popup);

      if (focusableElements.length === 0) return;

      const firstElement = focusableElements[0];
      const lastElement = focusableElements[focusableElements.length - 1];

      if (event.shiftKey) {
        if (document.activeElement === firstElement) {
          lastElement.focus();
          event.preventDefault();
        }
      } else {
        if (document.activeElement === lastElement) {
          firstElement.focus();
          event.preventDefault();
        }
      }
    }
  });
});
