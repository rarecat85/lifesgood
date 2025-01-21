gsap.registerPlugin(ScrollTrigger);
const { toArray } = gsap.utils;


// ScrollSmoother.create({
//   smooth: 1,
//   effects: true,
//   smoothTouch: 0.1,
// });

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
      onStart: () => {
        kvVideo.contentWindow.postMessage(
          JSON.stringify({
            event: "command",
            func: "playVideo",
            args: [],
          }),
          "*"
        );
      },
      onComplete: () => {
        ScrollTrigger.refresh()
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

    if (!videoSrc.includes('autoplay=1')) {
      kvVideo.setAttribute('src', `${videoSrc}&autoplay=1`);
    }  
  }

  
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
    prodVideoBtn.setAttribute('aria-pressed', 'false');
    prodVideoBtn.setAttribute('aria-label', 'play');
    prodVideoBtn.textContent = 'play';
  };

  prodSections.forEach((section) => {
    const prodInner = section.querySelector('.inner');
    const prodVideoTitle = section.querySelector('.products-video-title');
    const prodVideoBx = section.querySelector('.products-video');
    const prodVideo = section.querySelector('video');
    const prodVideoBtn = section.querySelector('.products-video-btn');

    const resetProps = () => {
      gsap.set([prodVideoTitle, prodInner, prodVideoBx, prodVideoBtn], { clearProps: 'all' });
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
          prodVideo.currentTime = 0;
        } else {
          prodVideo.play();
        }
      });
    };

    addVideoButtonListeners();

    if (isDesktop) {
      const isReverse = section.classList.contains('reverse');

      const prodTl = gsap.timeline({
        defaults: { ease: 'linear' },
      })
        .set(prodVideoBtn, { opacity: 0 })
        .to(prodVideoTitle, { opacity: 0, y: 20, duration: 3 })
        .call(() => prodVideo.play())
        .to(prodInner, { maxWidth: '1440px', duration: 2  })
        if(isDesktop) prodTl.to(prodVideoBx, { borderRadius: 28, })
        .to(prodVideoBtn, { opacity: 1,});

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

function staticProdVideoControls() {
  const videoContainers = document.querySelectorAll('.products-static-item-video');

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
          }
      };

      video.addEventListener('click', togglePlayPause);
      button.addEventListener('click', togglePlayPause);
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
  overviewAnimation();
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
  if (sections.includes('products-static')) {
    staticProdVideoControls();
  }
  if(sections.includes('stories')) {
    stories();
  }
  
  // 리사이즈 이벤트 처리
  window.addEventListener('resize', handleResize);
}

init();


