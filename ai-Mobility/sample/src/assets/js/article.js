gsap.registerPlugin(ScrollTrigger);
const { toArray } = gsap.utils;

const isPC = () => window.matchMedia('(min-width: 769px)').matches;
let isMobile;

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
  .from(fadeText,{opacity:0,y:20,stagger:0.5})

  const overviewTrigger = ScrollTrigger.create({
    trigger: overviewSection,
    start: 'top center',
    end: 'bottom center',
    animation: overviewTl,
    toggleActions: 'restart none none none'
  });
}

let prodTriggers;

function prodAnimation() {
  const isDesktop = isPC();
  const prodSections = document.querySelector('.products');

  if (prodTriggers) {
    prodTriggers.kill();
  }

  const resetVideoControls = (prodVideo, prodVideoBtn) => {
    prodVideo.pause();
    prodVideo.currentTime = 0;
    prodVideoBtn.setAttribute('aria-pressed', 'false');
    prodVideoBtn.setAttribute('aria-label', 'play');
    prodVideoBtn.textContent = 'play';
  };

  const prodInner = prodSections.querySelector('.inner');
  const prodVideoTitle = prodSections.querySelector('.products-video-title');
  const prodVideoBx = prodSections.querySelector('.products-video');
  const prodVideo = prodSections.querySelector('video');
  const prodVideoBtn = prodSections.querySelector('.products-video-btn');

  const resetProps = () => {
    gsap.set([prodVideoTitle, prodInner, prodVideoBx, prodVideoBtn], { clearProps: 'all' });
  };

  const addVideoButtonListeners = () => {
    prodVideoBtn.addEventListener('click', () => {
      const isPlaying = prodVideoBtn.getAttribute('aria-pressed') === 'true';
      prodVideoBtn.setAttribute('aria-pressed', !isPlaying);
      prodVideoBtn.setAttribute('aria-label', isPlaying ? 'play' : 'pause');
      prodVideoBtn.textContent = isPlaying ? 'play' : 'pause';

      if (isPlaying) {
        prodVideo.pause();
        prodVideo.currentTime = 0;
      } else {
        prodVideo.play();
      }
    });
  };

  addVideoButtonListeners();

  if (isDesktop) {
    const prodTl = gsap.timeline({
      defaults: { ease: 'linear' },
    })
      .set(prodVideoBtn, { opacity: 0 })
      .to(prodVideoTitle, { opacity: 0, y: 20, duration: 3 })
      .call(() => prodVideo.play()) // 비디오 자동 재생
      .to(prodInner, { maxWidth: '1200px', duration: 2 })
      .to(prodVideoBx, { borderRadius: 28 })
      .to(prodVideoBtn, { opacity: 1 });

    prodTriggers = ScrollTrigger.create({
      trigger: prodSections,
      start: 'top',
      end: '+=1200',
      pin: true,
      scrub: true,
      animation: prodTl,
      onLeaveBack: () => {
        resetVideoControls(prodVideo, prodVideoBtn);
      },
    });

  } else {
    resetProps();
    prodVideo.play(); // 모바일에서도 자동 재생 보장
    prodVideoBtn.setAttribute('aria-pressed', 'true');
    prodVideoBtn.setAttribute('aria-label', 'pause');
    prodVideoBtn.textContent = 'pause';
  }
}


function staticProdVideoControls() {
  const videoSections = toArray('.products-static-item');
  const videoContainers = toArray('.products-static-item-video');

  videoContainers.forEach((videoContainer) => {
      const video = videoContainer.querySelector('video');
      const button = videoContainer.querySelector('.products-static-item-video-btn');

      const togglePlayPause = () => {
          if (video.paused) {
              video.play();
              button.setAttribute('aria-pressed', 'true');
              button.textContent = 'pause';
          } else {
              video.pause();
              button.setAttribute('aria-pressed', 'false');
              button.textContent = 'play';
              video.currentTime = 0;
          }
      };

      video.addEventListener('click', togglePlayPause);
      button.addEventListener('click', togglePlayPause);

    });
    
    videoSections.forEach((videoSection) => {
      const video = videoSection.querySelector('video');
      const button = videoSection.querySelector('.products-static-item-video-btn');
      ScrollTrigger.create({
        trigger: videoSection,
        start: 'top center',
        end: 'bottom center',
        scrub:true,
        onEnter: () => {
          const video = videoSection.querySelector('video');
          if (video) {
            video.play();
            button.setAttribute('aria-pressed', 'true');
            button.textContent = 'pause';
          }
        },
        onLeaveBack: () => {
          if (video) {
            video.pause();
            button.setAttribute('aria-pressed', 'false');
            button.textContent = 'play';
            video.currentTime = 0;
          }
        }
      });
    })
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
        }
      },
    };
    
    const storiesSwiperInstance = new Swiper(storiesSwiper, storiesSwiperOptions);
  }
}


function handleResize() {
  const newIsMobile = !isPC(); 

  if (newIsMobile !== isMobile) {
    isMobile = newIsMobile;
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
  const sections = Array.from(toArray('section'), section => section.className);
  isMobile = !isPC();

  if (sections.includes('kv')) {
    kvAnimation();
  }
  if (sections.includes('products')) {
    prodAnimation();
  }
  if (sections.includes('overview')) {
    overviewAnimation();
  }
  if (sections.includes('products-static')) {
    staticProdVideoControls();
  }
  if(sections.includes('stories')) {
    stories();
  }
  
  // 리사이즈 이벤트 처리
  window.addEventListener('resize', debounce(handleResize));
}

init();


