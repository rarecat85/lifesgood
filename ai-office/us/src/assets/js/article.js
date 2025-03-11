gsap.registerPlugin(ScrollTrigger);
const { toArray } = gsap.utils;


const isPC = () => window.matchMedia('(min-width: 769px)').matches;
let isM; //250310 modify

function kvAnimation() {
  const kvSection = document.querySelector('.kv');
  const kvVideoBx = document.querySelector('.kv-conbx-video');
  const kvVideo = document.querySelector('.kv-conbx-video iframe');
  const kvVideoThumb = document.querySelector('.kv-conbx-video-thumb');
  const kvDesc = document.querySelector('.kv-conbx-desc');
  const videoSrc = kvVideo.getAttribute('src');
  let kvAnimationTl;
  let scrollTriggerInstance;

  if(isPC()) {
    kvAnimationTl = gsap.timeline({
      onComplete:()=>{
        ScrollTrigger.refresh();
      }
    })
      .to(kvDesc, {width:'100%'})
      .to(kvVideoBx,{width:'100%', maxWidth:'unset'},'<')
      .to(kvVideoThumb, { autoAlpha: 0 }, '<')

      scrollTriggerInstance = ScrollTrigger.create({
        trigger: kvSection,
        start: 'top',
        end: 'center end',
        scrub:true,
        animation: kvAnimationTl,
        once: true
      });
  }else {
    if (kvAnimationTl) {
      kvAnimationTl.kill();
      kvAnimationTl = null;
    }
    if (scrollTriggerInstance) {
      scrollTriggerInstance.kill();
      scrollTriggerInstance = null;
    }
    gsap.set([kvDesc, kvVideoBx, kvVideoThumb], { clearProps: 'all' }); 
  }
}

function overviewAnimation() {
  const overviewSection = document.querySelector('.overview');
  const fadeText = toArray('.fade-up');

  const overviewTl = gsap.timeline()
  .from(fadeText,{opacity:0,y:20})

  const overviewTrigger = ScrollTrigger.create({
    trigger: overviewSection,
    start: 'top center',
    end: 'bottom center',
    animation: overviewTl,
    toggleActions: 'restart none none none'
  });
}

let prodTriggers = [];

function prodAnimation() {
  const isDesktop = isPC();
  const prodSections = toArray('.products');

  prodTriggers.forEach(trigger => trigger.kill());
  prodTriggers.length = 0;

  const resetVideoControls = (prodVideo, prodVideoBtn) => {
    prodVideo.pause();
    prodVideo.currentTime = 0;
    // prodVideoBtn.setAttribute('aria-pressed', 'false');
    // prodVideoBtn.setAttribute('aria-label', 'play');
    // prodVideoBtn.textContent = 'play';
  };

  prodSections.forEach((section) => {
    const prodInner = section.querySelector('.inner');
    const prodVideoTitle = section.querySelector('.products-video-title');
    const prodVideoBx = section.querySelector('.products-video');
    const prodVideo = section.querySelector('video');
    const prodTextBx = section.querySelector('.products-textbx');
    const prodTextChildren = toArray(prodTextBx.children);
    const prodVideoBtn = section.querySelector('.products-video-btn');
    const prodDimmed = section.querySelector('.dimmed');

    const resetProps = () => {
      gsap.set([prodTextChildren, prodVideoTitle, prodInner, prodVideoBx, prodVideoBtn], { clearProps: 'all' });
    };

    const playVideoOnView = () => {
      const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
          if (entry.isIntersecting) {
            prodVideo.play();
            prodVideoBtn.setAttribute('aria-pressed', 'true');
            prodVideoBtn.setAttribute('aria-label', 'pause');
            prodVideoBtn.textContent = 'pause';
          } else {
            resetVideoControls(prodVideo, prodVideoBtn);
          }
        });
      }, {
        threshold: 0.5
      });
      observer.observe(section);
    };

    const addVideoButtonListeners = () => {
      prodVideoBtn.addEventListener('click', () => {
        const isPlaying = prodVideoBtn.getAttribute('aria-pressed') === 'true';
        prodVideoBtn.setAttribute('aria-pressed', !isPlaying);
        prodVideoBtn.setAttribute('aria-label', isPlaying ? 'play' : 'pause');
        prodVideoBtn.textContent = isPlaying ? 'play' : 'pause';

        if (isPlaying) {
          prodVideo.pause();
          // prodVideo.currentTime = 0;
        } else {
          prodVideo.play();
        }
      });
    };

    addVideoButtonListeners();

    if (isDesktop) {
      const isReverse = section.classList.contains('reverse');
      const xValue = (24 / 16) + 'rem';
      const adjustedX = isReverse ? `-${xValue}` : xValue;

      const prodTl = gsap.timeline({
        defaults: { ease: 'linear' },
      })
        .set(prodVideoBtn, { opacity: 0 })
        .set(prodTextChildren, { opacity: 0, y: 20 })
        .to(prodVideoTitle, { opacity: 0, y: 20, duration: 3 })
        .to(prodDimmed, { opacity: 0, duration: 3 })
        .call(() => prodVideo.play())
        .to(prodInner, { maxWidth: '1440px' })
        .to(prodVideoBx, { scale: 0.5083, x: adjustedX, borderRadius: 28, duration: 2 })
        .to(prodTextChildren, { opacity: 1, y: 0, stagger: 0.2 })
        .to(prodVideoBtn, { opacity: 1, scale: 2.4585 });

      const trigger = ScrollTrigger.create({
        trigger: section,
        start: 'top',
        end: '+=1200',
        pin: true,
        scrub: true,
        animation: prodTl,
        onLeaveBack: () => {
          resetVideoControls(prodVideo, prodVideoBtn);
        },
      });

      prodTriggers.push(trigger);
    } else {
      resetProps();
      playVideoOnView();
    }
  });

  window.addEventListener('resize', () => {
    prodSections.forEach(section => {
      const prodVideo = section.querySelector('video');
      const prodVideoBtn = section.querySelector('.products-video-btn');

      resetVideoControls(prodVideo, prodVideoBtn);
    });

    prodAnimation();
  });
}

function stories() {
  const storiesSwiper = document.querySelector('.stories-conbx');

  if (storiesSwiper) {
    const storiesSwiperOptions = {
      slidesPerView: 'auto',
      spaceBetween: 10,
      navigation: {
        nextEl: '.stories-swiper-button-next',
        prevEl: '.stories-swiper-button-prev',
      },
      pagination: {
        el: '.stories-swiper-pagination',
        type: 'fraction',
        clickable: true,
      },
      breakpoints: {
        768: {
            slidesPerView: 2,
            spaceBetween: 16
        },
        1441: {
            slidesPerView: 3,
            spaceBetween: 24
        }
      },
    };
    
    const storiesSwiperInstance = new Swiper(storiesSwiper, storiesSwiperOptions);
  }
}

function productsSwiper() {
  function initializeProductsSwipers() {
    const productsSwipers = document.querySelectorAll('.products-textbx-thumbbx');
  
    if (productsSwipers.length > 0) {
      const productsSwiperOptions = {
        slidesPerView: 'auto',
        spaceBetween: 12,
        breakpoints: {
          768: {
            spaceBetween: 16,
          },
        },
      };
  
      productsSwipers.forEach((swiperElement) => {
        const swiperInstance = new Swiper(swiperElement, productsSwiperOptions);
  
        swiperElement.querySelectorAll('.swiper-slide').forEach((slide, index) => {
          if (!slide.dataset.eventBound) {
            slide.addEventListener('click', () => {
              handleSlideClick(slide, index, swiperElement);
            });
            slide.dataset.eventBound = 'true'; 
          }
        });
      });
    }
  }
  
  function handleSlideClick(slide, index, swiperElement) {
    const layer = document.querySelector('.products-layer');
    const contentWrapper = layer.querySelector('.products-layer-content-swiper-wrapper');
    const thumbWrapper = layer.querySelector('.products-layer-content-thumb-swiper-wrapper');
  
    // 기존 내용 초기화
    contentWrapper.innerHTML = '';
    thumbWrapper.innerHTML = '';
  
    // `.products-textbx` 컨텍스트에서 Eyebrow와 버튼 찾기
    const productsTextbx = swiperElement.closest('.products-textbx');
    const eyebrowElement = productsTextbx?.querySelector('.products-textbx-eyebrow');
    const btnElement = productsTextbx?.querySelector('.btn');
  
    // Eyebrow 텍스트 설정
    const eyebrowText = eyebrowElement ? eyebrowElement.textContent.trim() : 'Untitled';
    const headerTitleElement = layer.querySelector('.products-layer-header-title-bx-title');
    headerTitleElement.textContent = eyebrowText;
  
    // 버튼 링크 설정
    const buttonHref = btnElement ? btnElement.getAttribute('href') : null;
    const headerButtonElement = layer.querySelector('.products-layer-header-title-bx-btn');
    if (buttonHref) {
      headerButtonElement.setAttribute('href', buttonHref);
      headerButtonElement.style.display = 'flex'; // 버튼 보이기
    } else {
      headerButtonElement.style.display = 'none'; // 버튼 숨기기
    }
  
    // 슬라이드 데이터 추가
    const allSlides = swiperElement.querySelectorAll('.swiper-slide');
  
    allSlides.forEach((slide, idx) => {
      const img = slide.querySelector('img');
      const imgSrc = img.getAttribute('src');
      const contentImgSrc = imgSrc.replace('-thumb-', '-img-');

      // 🔹 data-title, data-desc 가져오기
      const slideTitle = slide.dataset.title || '';
      const slideDesc = slide.dataset.desc || '';
      const slideAlt = slide.dataset.alt || '';
  
      const contentSlide = document.createElement('div');
      contentSlide.className = 'swiper-slide';
      contentSlide.style.position = 'relative';
      contentSlide.style.overflow = 'hidden';
  
      const imageWrapper = document.createElement('div');
      imageWrapper.style.position = 'absolute';
      imageWrapper.style.top = '0';
      imageWrapper.style.left = '0';
      imageWrapper.style.right = '0';
      imageWrapper.style.bottom = '0';
      imageWrapper.style.zIndex = '1';
      imageWrapper.style.overflow = 'hidden';
      imageWrapper.style.backgroundColor = 'rgba(0,0,0,0.25)';
  
      const backgroundImg = document.createElement('img');
      backgroundImg.src = contentImgSrc;
      backgroundImg.style.width = '100%';
      backgroundImg.style.height = '100%';
      backgroundImg.style.objectFit = 'cover';
      backgroundImg.style.filter = 'blur(35px)';
  
      imageWrapper.appendChild(backgroundImg);
      contentSlide.appendChild(imageWrapper);
  
      if (slide.classList.contains('video-slide')) {
        const videoMp4 = imgSrc.replace('/images/', '/videos/').replace('-img-', '-video-').replace(/\.\w+$/, '.mp4');
        const videoWebm = imgSrc.replace('/images/', '/videos/').replace('-img-', '-video-').replace(/\.\w+$/, '.webm');
  
        const videoElement = document.createElement('video');
        videoElement.controls = true;
        videoElement.style.position = 'relative';
        videoElement.style.zIndex = '2';
  
        const sourceMp4 = document.createElement('source');
        sourceMp4.src = videoMp4;
        sourceMp4.type = 'video/mp4';
  
        const sourceWebm = document.createElement('source');
        sourceWebm.src = videoWebm;
        sourceWebm.type = 'video/webm';
  
        videoElement.appendChild(sourceMp4);
        videoElement.appendChild(sourceWebm);
        videoElement.setAttribute('aria-label',slideAlt);
  
        contentSlide.appendChild(videoElement);
      } else {
        const contentImg = document.createElement('img');
        contentImg.src = contentImgSrc;
        contentImg.style.position = 'relative';
        contentImg.style.zIndex = '2';
        contentImg.setAttribute('alt',slideAlt);
        contentSlide.appendChild(contentImg);
      }
  
      contentWrapper.appendChild(contentSlide);
  
      const thumbSlide = document.createElement('div');
      thumbSlide.className = 'swiper-slide';
      thumbSlide.dataset.title = slideTitle; // data-title 저장
      thumbSlide.dataset.desc = slideDesc; // data-desc 저장

      // const thumbImg = document.createElement('img');
      // thumbImg.src = imgSrc;
      const thumbSlideItem = slide.children[0].cloneNode(true);
      thumbSlideItem.dataset.dynamicParam5 = 'outer';
      thumbSlide.appendChild(thumbSlideItem);
      thumbWrapper.appendChild(thumbSlide);
    });
  
    // 레이어 표시 및 스크롤 비활성화
    layer.setAttribute('aria-hidden', 'false');
    layer.style.display = 'block';
    document.body.classList.add('noscroll');
  
    // Swiper 초기화 및 활성 슬라이드 이동
    setTimeout(() => {
      const { contentSwiper, thumbSwiper } = initializeLayerSwipers();
      contentSwiper.update();
      contentSwiper.slideTo(index, 0);
      thumbSwiper.update();
      thumbSwiper.slideTo(index, 0);

      updateActiveSlideText(contentSwiper.activeIndex, thumbWrapper);
    }, 0);
  }
  
  function updateActiveSlideText(activeIndex, thumbWrapper) {
    const layer = document.querySelector('.products-layer');
    const titleElement = layer.querySelector('.products-layer-content-txtwrap-txtbx-title');
    const descElement = layer.querySelector('.products-layer-content-txtwrap-txtbx-desc');

    const activeThumbSlide = thumbWrapper.children[activeIndex];

    if (activeThumbSlide) {
        const title = activeThumbSlide.dataset.title || '';
        const desc = activeThumbSlide.dataset.desc || '';

        titleElement.textContent = title;
        descElement.textContent = desc;
    }
  }

  function initializeLayerSwipers() {
    let currentPlayingVideo = null;
  
    const thumbSwiper = new Swiper('.products-layer-content-thumb-swiper', {
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
  
    const contentSwiper = new Swiper('.products-layer-content-swiper', {
      slidesPerView: 1,
      spaceBetween: 0,
      navigation: false,
      thumbs: {
        swiper: thumbSwiper,
      },
    });
  
    contentSwiper.on('slideChange', () => {
      if (currentPlayingVideo) {
        currentPlayingVideo.pause();
        currentPlayingVideo.currentTime = 0;
        currentPlayingVideo = null;
      }
  
      const activeSlide = contentSwiper.slides[contentSwiper.activeIndex];
      const videoElement = activeSlide.querySelector('video');
  
      const activeSlideIndex = contentSwiper.activeIndex;
      updateActiveSlideText(activeSlideIndex, document.querySelector('.products-layer-content-thumb-swiper-wrapper'));
      
      if (videoElement) {
        videoElement.muted = true;
        videoElement.play();
        currentPlayingVideo = videoElement;
      }
    });

    const initialSlide = contentSwiper.slides[contentSwiper.activeIndex];
    const initialVideo = initialSlide.querySelector('video');
    if (initialVideo) {
      initialVideo.muted = true;
      initialVideo.play();
      currentPlayingVideo = initialVideo;
    }
  
    return { contentSwiper, thumbSwiper };
  }
  
  document.querySelector('.products-layer').addEventListener('click', (event) => {
    const layerContentBox = document.querySelector('.products-layer-conbx');
    if (!layerContentBox.contains(event.target)) {
      const layer = document.querySelector('.products-layer');
      layer.setAttribute('aria-hidden', 'true');
      layer.style.display = 'none';
      document.body.classList.remove('noscroll'); 
    }
  });
  
  document.querySelector('.products-layer-header-close').addEventListener('click', () => {
    const layer = document.querySelector('.products-layer');
    layer.setAttribute('aria-hidden', 'true');
    layer.style.display = 'none';
    document.body.classList.remove('noscroll'); 
  });
  
  initializeProductsSwipers();
}

function disclaimerAction() {
  const items = document.querySelectorAll(".disclaimer-list-item-header");

  items.forEach(item => {
    item.addEventListener("click", function () {
      document.querySelectorAll(".disclaimer-list-item").forEach(el => {
        el.classList.remove("on");
      });

      this.closest(".disclaimer-list-item").classList.add("on");
    });
  });
}

function handleResize() {
  const newIsMobile = !isPC(); 

  if (newIsMobile !== isM) { //250310 modify
    isM = newIsMobile; //250310 modify
    kvAnimation(); 
    prodAnimation(); 
  }
  
  ScrollTrigger.refresh();
}

function debounce(func, delay=500) {
  let timer;
  return function (...args) {
      if (timer) clearTimeout(timer);  // 기존 타이머 제거
      timer = setTimeout(() => func.apply(this, args), delay); // 새 타이머 설정
  };
}

function init() {
  document.querySelector('body').classList.add('noscroll');
  const sections = Array.from(toArray('section'), section => section.className);
  isM = !isPC(); //250310 modify

  if (sections.includes('kv')) {
    kvAnimation();
  }
  if (sections.includes('overview')) {
    overviewAnimation();
  }
  if (sections.includes('products')) {
    prodAnimation();
    productsSwiper();
  }

  if(sections.includes('stories')) {
    stories();
  }

  if(document.querySelector('.disclaimer')) {
    disclaimerAction();
  }
  // 리사이즈 이벤트 처리
  window.addEventListener('resize', debounce(handleResize));

  // 페이지 로드 완료 시 noscroll 클래스 제거
  window.addEventListener('load', () => {
    document.querySelector('body').classList.remove('noscroll');
  });
}

init();


