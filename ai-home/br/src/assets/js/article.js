gsap.registerPlugin(ScrollTrigger);
gsap.registerPlugin(ScrollToPlugin);
const { toArray } = gsap.utils;

const isPC = () => window.matchMedia('(min-width: 769px)').matches;
let isMobile;
let prevWidth = window.innerWidth;
let kvScrollTriggerInstance;

function kvAnimation() {
  const kvSection = document.querySelector('.kv');
  if (!kvSection) {
    kvScrollTriggerInstance = null;
    return;
  }
  
  const kvVideoBx = document.querySelector('.kv-conbx-video');
  const kvVideo = document.querySelector('.kv-conbx-video iframe');
  const kvVideoThumb = document.querySelector('.kv-conbx-video-thumb');
  const kvDesc = document.querySelector('.kv-conbx-desc');
  const videoSrc = kvVideo ? kvVideo.getAttribute('src') : '';
  let kvAnimationTl;
  let scrollTriggerInstance;

  if(isPC()) {
    kvAnimationTl = gsap.timeline({
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
      
      kvScrollTriggerInstance = scrollTriggerInstance;
  }else {
    if (kvAnimationTl) {
      kvAnimationTl.kill();
      kvAnimationTl = null;
    }
    if (scrollTriggerInstance) {
      scrollTriggerInstance.kill();
      scrollTriggerInstance = null;
    }
    kvScrollTriggerInstance = null;
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
  };

  prodSections.forEach((section) => {
    const prodInner = section.querySelector('.inner');
    const prodVideoTitle = section.querySelector('.products-video-title');
    const prodVideoBx = section.querySelector('.products-video');
    const prodVideo = section.querySelector('video');
    const prodTextBx = section.querySelector('.products-textbx');
    const prodTextChildren = toArray(prodTextBx.children);
    const prodVideoBtn = section.querySelector('.products-video-btn');
    const prodImgBx = prodVideoBx.classList.contains('img-type');

    const resetProps = () => {
      if(prodImgBx) {
        gsap.set([prodTextChildren, prodVideoTitle, prodInner, prodVideoBx], { clearProps: 'all' });
      }else {
        gsap.set([prodTextChildren, prodVideoTitle, prodInner, prodVideoBx, prodVideoBtn], { clearProps: 'all' });
      }
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
        } else {
          prodVideo.play();
        }
      });
    };

    if(!prodImgBx) {
      addVideoButtonListeners();
    }
  
    

    if (isDesktop) {
      const isReverse = section.classList.contains('reverse');
      const xValue = (24 / 16) + 'rem';
      const adjustedX = isReverse ? `-${xValue}` : xValue;

      const prodTl = gsap.timeline({
        defaults: { ease: 'linear' },
      })
      if(!prodImgBx) prodTl.set(prodVideoBtn, { opacity: 0 });
      prodTl.set(prodTextChildren, { opacity: 0, y: 20 })
        .to(prodVideoTitle, { opacity: 0, y: 20, duration: 3 })
      if(!prodImgBx) prodTl.call(() => prodVideo.play());
      prodTl.to(prodInner, { maxWidth: '1440px' })
      .to(prodVideoBx, { scale: 0.5083, x: adjustedX, borderRadius: 28, duration: 2 });
      prodTl.to(prodTextChildren, { opacity: 1, y: 0, stagger: 0.2 })
      if(!prodImgBx) prodTl.to(prodVideoBtn, { opacity: 1, scale: 2.4585 });

      const trigger = ScrollTrigger.create({
        trigger: section,
        start: 'top',
        end: '+=1200',
        pin: true,
        scrub: true,
        animation: prodTl,
        onLeaveBack: () => {
          if(!prodImgBx) {
            resetVideoControls(prodVideo, prodVideoBtn);
          }
        },
      });

      prodTriggers.push(trigger);
    } else {
      resetProps();
      if(!prodImgBx) {
        playVideoOnView();
      }
    }
  });

  // window.addEventListener('resize', () => {
  //   prodSections.forEach(section => {
  //     const prodVideo = section.querySelector('video');
  //     const prodVideoBtn = section.querySelector('.products-video-btn');
  //     const prodImgBx = section.querySelector('.products-video').classList.contains('img-type');

  //     if(!prodImgBx) {
  //       resetVideoControls(prodVideo, prodVideoBtn);
  //     }
  //   });

  //   prodAnimation();
  // });
  setupFloatingBannerWithScrollTrigger();
}

// ScrollTrigger를 이용한 플로팅 배너 설정 함수
function setupFloatingBannerWithScrollTrigger() {
  const floatingBanner = document.querySelector('.products-floating-banner');
  if (!floatingBanner) return;
  
  // 닫기 버튼 이벤트 리스너
  const closeBtn = floatingBanner.querySelector('.products-floating-banner-close');
  if (closeBtn) {
    closeBtn.addEventListener('click', () => {
      floatingBanner.style.display = 'none';
    });
  }

  // 기존 ScrollTrigger 인스턴스 제거
  ScrollTrigger.getAll().forEach(trigger => {
    if (trigger.vars.id === 'floatingBannerTrigger') {
      trigger.kill();
    }
  });

  // 전체 products 섹션을 관리하는 함수
  function updateFloatingBanner() {
    // 각 섹션별 플로팅 배너 데이터 정의
    const floatingBannerData = {
      oled: {
        imgSrc: "/content/dam/master-2/hq_gmg/brand-platform/life's-good-campaign/2025/live-human/lgcom/lgebr/ai-home/images/lifes-good-campaign-2025-live-human-lgcom-ai-home-img-floating-banner-img-oled.png",
        title: 'Smart TV LG OLED evo AI G4 4K 65 polegadas 2024',
        link: 'https://www.lg.com/br/tvs-e-soundbars/oled-evo/oled65g4psa/'
      },
      washtower: {
        imgSrc: "/content/dam/master-2/hq_gmg/brand-platform/life's-good-campaign/2025/live-human/lgcom/lgebr/ai-home/images/lifes-good-campaign-2025-live-human-lgcom-ai-home-img-floating-banner-img-washtower.png", 
        title: 'Lava e Seca Torre WashTower 14kg Black Inox - 127V',
        link: 'https://www.lg.com/br/lavanderia/washtower/wk14bs6/'
      },
      xboom: {
        imgSrc: "/content/dam/master-2/hq_gmg/brand-platform/life's-good-campaign/2025/live-human/lgcom/lgebr/ai-home/images/lifes-good-campaign-2025-live-human-lgcom-ai-home-img-floating-banner-img-xboom.png",
        title: 'LG XBOOM XG9S Caixa de som Bluetooth portátil - IP67 e 24 horas de bateria',
        link: 'https://www.lg.com/br/audio/caixas-de-som-portateis-xboom-go/xg9s/'
      },
      stanbyme: {
        imgSrc: "/content/dam/master-2/hq_gmg/brand-platform/life's-good-campaign/2025/live-human/lgcom/lgebr/ai-home/images/lifes-good-campaign-2025-live-human-lgcom-ai-home-img-floating-banner-img-stanbyme.png",
        title: 'LG StanbyME',
        link: 'https://www.lg.com/br/tvs-telas-lifestyle/stanbyme/27art10akpl/'
      }
    };

    const floatingBanner = document.querySelector('.products-floating-banner');
    if (!floatingBanner) return;
    
    // 모든 products 섹션 가져오기
    const productSections = document.querySelectorAll('.products');
    const lastSection = productSections[productSections.length - 1];
    
    // 화면 중앙에 가장 가까운 섹션 찾기
    let closestSection = null;
    let minDistance = Infinity;
    
    // 화면에 보이는 섹션들 중에 floatingBannerData에 일치하는 값이 있는지 확인
    let hasMatchingSection = false;
    let matchingSectionData = null;
    
    productSections.forEach(section => {
      // 섹션이 화면에 보이는지 확인
      const rect = section.getBoundingClientRect();
      let isVisible;
      
      // 마지막 섹션인 경우 다른 조건 적용
      if (section === lastSection) {
        // 마지막 섹션은 bottom이 화면 하단을 넘어가지 않았을 때만 visible로 간주
        isVisible = 
          (rect.top < window.innerHeight && rect.bottom > 0) && // 세로로 화면에 보이는지
          (rect.bottom > window.innerHeight); // 섹션의 하단이 화면 하단을 넘어갔는지
      } else {
        // 다른 섹션들은 기존 조건 유지
        isVisible = 
          (rect.top < window.innerHeight && rect.bottom > 0) && // 세로로 화면에 보이는지
          (rect.top < window.innerHeight * 0.7 && rect.bottom > window.innerHeight * 0.3); // 화면의 특정 부분에 보이는지
      }
      
      // 화면 중앙에서 섹션 중앙까지의 거리 계산
      if (isVisible) {
        const screenCenter = window.innerHeight / 2;
        const sectionCenter = rect.top + rect.height / 2;
        const distance = Math.abs(screenCenter - sectionCenter);
        
        // 가장 가까운 섹션 업데이트
        if (distance < minDistance) {
          minDistance = distance;
          closestSection = section;
        }
        
        // 현재 보이는 섹션의 data-section 값이 floatingBannerData에 있는지 확인
        const sectionId = section.getAttribute('data-section');
        if (sectionId && floatingBannerData[sectionId]) {
          hasMatchingSection = true;
          matchingSectionData = {
            id: sectionId,
            data: floatingBannerData[sectionId]
          };
        }
      }
    });
    
    // 가장 가까운 섹션이 변경되면 콘솔에 출력
    if (closestSection && (!window.lastActiveSection || window.lastActiveSection !== closestSection)) {
      const sectionId = closestSection.getAttribute('data-section');
      console.log('현재 활성 섹션:', sectionId);
      
      // 이전 활성 섹션 정보 저장
      window.lastActiveSection = closestSection;
    }
    
    // floatingBannerData에 매칭되는 섹션이 있을 경우 배너 업데이트 및 표시
    if (hasMatchingSection && matchingSectionData) {
      const { id, data } = matchingSectionData;
      
      // 배너 내용 업데이트
      const imgElement = floatingBanner.querySelector('.products-floating-banner-content-img img');
      const titleElement = floatingBanner.querySelector('.products-floating-banner-content-title');
      const linkElement = floatingBanner.querySelector('.btn');
      
      if (imgElement) imgElement.src = data.imgSrc;
      if (titleElement) titleElement.textContent = data.title;
      if (linkElement) linkElement.href = data.link;
      
      // 배너 표시
      floatingBanner.style.display = 'flex';
    } else {
      // 매칭되는 섹션이 없으면 배너 숨김
      floatingBanner.style.display = 'none';
    }
  }
  
  // 스크롤 이벤트에 배너 업데이트 함수 연결
  ScrollTrigger.create({
    id: 'floatingBannerTrigger',
    start: 0,
    end: 'max',
    onUpdate: updateFloatingBanner,
    markers: false,
  });
  
  // 초기 상태 설정
  updateFloatingBanner();
}

function tabAnimation() {
  const tabList = toArray('.thinQ-tabs-imgbx-fixedimg-tablist li');
  const tabBg = toArray('.thinQ-tabs-imgbx-bgwrap-bgimg');
  const tabCon = toArray('.thinQ-tabs-conbx-tabcon');
  const titleElement = document.querySelector('.thinQ-tabs-imgbx-fixedimg-title');
  const tabicons = toArray('.thinQ-tabs-imgbx-fixedimg-tab-icon');

  const tabTitles = [
    '"Hi, LG"',
    '"Welcome back"' 
  ];

  let changeImg = tabBg.find(li => li.classList.contains('active'));
  let currentTimeline = null;

  function animateTitle(text) {
    const splitText = text.split('');
    titleElement.textContent = '';

    splitText.forEach((char, index) => {
      const span = document.createElement('span');
      span.textContent = char;
      span.style.opacity = '0';
      span.style.transform = 'translateY(10px)';
      titleElement.appendChild(span);

      gsap.to(span, {opacity: 1, y: 0, delay: index * 0.05, duration: 0.2});
    });
  }

  tabList.forEach((tab, index) => {
    tab.addEventListener('click', () => {
      if (currentTimeline) currentTimeline.progress(1);
  
      const currentImg = changeImg.querySelector('img');
  
      tabList.forEach(t => {
        t.classList.remove('active');
        t.setAttribute('aria-selected', 'false');
      });
      tab.classList.add('active');
      tab.setAttribute('aria-selected', 'true');
  
      tabCon.forEach(con => {
        con.classList.remove('active');
        con.setAttribute('tabindex', '-1');
      });
      tabCon[index].classList.add('active');
      tabCon[index].setAttribute('tabindex', '0');
  
      tabicons.forEach(icon => {
        icon.classList.remove('active');
      });
      tabicons[index].classList.add('active');
  
      animateTitle(tabTitles[index]);
  
      currentTimeline = gsap.timeline()
        .set(currentImg, { opacity:0 })
        .to(changeImg, { borderRadius: '100%', scale: 0, duration: 1 })
        .eventCallback('onComplete', () => {
          tabBg.forEach(bg => bg.classList.remove('active'));
          tabBg[index].classList.add('active');
  
          gsap.set(currentImg, { opacity:1 });
          gsap.set(changeImg, { borderRadius: '0%', scale: 1 });
          changeImg = tabBg[index];
  
          currentTimeline = null;
        });
    });
  });

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
        sourceWebm.type = 'videos/webm';
  
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

function isKvAnimationComplete() {
  if (!document.querySelector('.kv') || !isPC() || !kvScrollTriggerInstance) {
    return true;
  }
  
  return kvScrollTriggerInstance.progress >= 1;
}

function adjustScrollPosition(targetElem) {
  const targetPosition = targetElem.getBoundingClientRect().top + window.scrollY - 50;
  window.scrollTo({
    top: targetPosition,
    behavior: 'smooth'
  });
}

function handleResize() {
  const currentWidth = window.innerWidth;
  
  if (currentWidth !== prevWidth) {
    const newIsMobile = !isPC(); 

    if (newIsMobile !== isMobile) {
      isMobile = newIsMobile;
      kvAnimation(); 
      prodAnimation(); 
      ScrollTrigger.refresh();
    }
  }
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
  isMobile = !isPC();

  if (sections.includes('kv')) {
    kvAnimation();
  }
  if (sections.includes('products')) {
    prodAnimation();
    productsSwiper();
  }
  if (sections.includes('overview')) {
    overviewAnimation();
  }
  if (sections.includes('thinQ-tabs')) {
    tabAnimation();
  }

  if(document.querySelector('.disclaimer')) {
    disclaimerAction();
  }

  // 리사이즈 이벤트 처리
  window.addEventListener('resize', debounce(handleResize));
  // 페이지 로드 완료 시 noscroll 클래스 제거
  window.addEventListener('load', () => {
    document.querySelector('body').classList.remove('noscroll');
    
    const url = new URL(window.location.href);
    const sectionParam = url.searchParams.get("section");
  
    if (sectionParam) {
      const targetElem = document.querySelector(`[data-section="${sectionParam}"]`);
      
      if (targetElem) {
        gsap.to(window, {
          scrollTo: {
            y: targetElem,
            offsetY: 50
          },
          duration: 1,
          ease: "power2.out",
          onComplete: () => {
            if (isKvAnimationComplete()) {
              adjustScrollPosition(targetElem);
            } else {
              const checkInterval = setInterval(() => {
                if (isKvAnimationComplete()) {
                  clearInterval(checkInterval);
                  adjustScrollPosition(targetElem);
                }
              }, 100);

              setTimeout(() => {
                clearInterval(checkInterval);
                adjustScrollPosition(targetElem);
              }, 5000);
            }
          }
        });
      }
    }
  });
}

init();