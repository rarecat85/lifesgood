document.addEventListener("DOMContentLoaded", function () {
  const heroVideoBx = document.querySelector(".hero-visual .video-bx");
  const heroToggleBtn = document.querySelector(".play-btn");
  let currentVideoSrc = "";

  // 영상을 동적으로 설정하는 함수
  function setHeroVideo() {
    const isDesktop = window.innerWidth > 1025;
    const newVideoSrc = isDesktop
      ? "./assets/video/lifes-good-campaign-2025-live-human-lgcom-gate-video-hero-kv-desktop.mp4"
      : "./assets/video/lifes-good-campaign-2025-live-human-lgcom-gate-video-hero-kv-mobile.mp4";

    // 현재 영상이 변경된 경우에만 업데이트
    if (currentVideoSrc !== newVideoSrc) {
      heroVideoBx.innerHTML = `
        <video autoplay muted playsinline loop aria-label="A man and a woman lie intertwined on the living room sofa while the LG TV plays a cooking channel. After the woman falls asleep, the man calls out, "Hi LG," asking to play the soccer match, and the channel switches to the game.">
          <source src="${newVideoSrc}">
        </video>
      `;
      currentVideoSrc = newVideoSrc;
    }
  }

  // 초기 영상 설정
  setHeroVideo();

  // 디바운싱된 리사이즈 이벤트 핸들러 for Hero Video
  let resizeTimeoutHeroVideo;
  window.addEventListener("resize", function () {
    clearTimeout(resizeTimeoutHeroVideo);
    resizeTimeoutHeroVideo = setTimeout(function () {
      setHeroVideo();
    }, 150); // 150ms 딜레이로 디바운스
  });

  /* kv 영상 play / pause 버튼 */
  heroToggleBtn.addEventListener("click", function () {
    const heroVideo = document.querySelector(".hero-visual video");
    if (this.classList.contains("active")) {
      this.classList.remove("active");
      heroVideo.play();
    } else {
      this.classList.add("active");
      heroVideo.pause();
    }
  });

  // 타임라인 생성 함수
  gsap.registerPlugin(ScrollTrigger);

  // 요소 선택
  const articleBannerAnimation = document.querySelector('.section.article-banner');

  const img01 = document.querySelector(".overview .img-list .img01");
  const img02 = document.querySelector(".overview .img-list .img02");
  const img03 = document.querySelector(".overview .img-list .img03");
  const img04 = document.querySelector(".overview .img-list .img04");
  const img05 = document.querySelector(".overview .img-list .img05");
  const img06 = document.querySelector(".overview .img-list .img06");
  const title1 = document.querySelector(".overview .txt-bx .bx-1 .title");
  const txt1 = document.querySelector(".overview .txt-bx .bx-1 p");
  const title2 = document.querySelector(".overview .txt-bx .bx-2 .title");
  const txt2 = document.querySelector(".overview .txt-bx .bx-2 p");
  const redPoint = document.querySelector(".red-point");

  // ScrollTrigger의 matchMedia를 사용하여 미디어 쿼리 적용
  ScrollTrigger.matchMedia({
    // PC (1440px 이상)
    "(min-width: 1440px)": function() {
      // 미디어 쿼리 활성화 시 기본 이미지 설정
      redPoint.classList.remove('active');
      redPoint.setAttribute("src","./assets/img/lifes-good-campaign-2025-live-human-lgcom-gate-img-red-point.svg");

      const articleBanner = gsap.timeline({
        scrollTrigger: {
          trigger: ".section.article-banner",
          start: "270%",
          end: "10%",
          scrub: 1,
          onEnter: function() {
            articleBannerAnimation.classList.add('active');
          },
          onLeaveBack: function() {
            articleBannerAnimation.classList.remove('active');
          },
        },
      });

      const heroVisual = gsap.timeline({
        scrollTrigger: {
          trigger: ".section.overview",
          start: "top top",
          onRefresh: self => {    
            let resizeTimer;
            window.addEventListener("resize", () => {
              clearTimeout(resizeTimer);
              resizeTimer = setTimeout(() => {
                ScrollTrigger.refresh();
              }, 250);
            });    
          },
          invalidateOnRefresh: true,
          end: "+=300%",
          pin: true,
          scrub: 1,
          onLeave: function() {
            redPoint.classList.add('active');
            redPoint.setAttribute("src","./assets/img/lifes-good-campaign-2025-live-human-lgcom-gate-img-ai-symbol.gif");
          },
          onEnterBack: function() {
            redPoint.classList.remove('active');
            redPoint.setAttribute("src","./assets/img/lifes-good-campaign-2025-live-human-lgcom-gate-img-red-point.svg");
          },
        },
      });

      heroVisual
        .addLabel('imgShow')
        .to(img01, { x: "-33vw", y: "-10svh", scale: 0.5 }, "imgShow")
        .to(img02, { x: "-24.5vw", y: "-35.3svh", scale: 0.3614 }, "imgShow")
        .to(img03, { x: "30.5vw", y: "-29.8svh", scale: 0.5 }, "imgShow")
        .to(img04, { x: "20.5vw", y: "34svh", scale: 0.3614 }, "imgShow")
        .to(img05, { x: "31.6vw", y: "22svh", scale: 0.5 }, "imgShow")
        .to(img06, { x: "-28.5vw", y: "34svh", scale: 0.3614 }, "imgShow")
        .to(title1, { opacity: 1, y: 0 })
        .to(txt1, { opacity: 1, y: 0 })
        .addLabel('txtFade')
        .to(title1, { opacity: 0 }, "txtFade")
        .to(txt1, { opacity: 0 }, "txtFade")
        .to(txt2, { opacity: 1, y: 0 })
        .to(title2, { opacity: 1, y: 0 })
        .to(redPoint, {opacity: 0.5})
        .to(redPoint, { width: "10vw", scale:0.8, duration: 1 })
        .to(redPoint, { width: 8, scale:1, duration: 0.3 });

      // 클린업 함수 (필요 시)
      return () => {
        // 예: redPoint 기본 상태로 복원
        redPoint.classList.remove('active');
        redPoint.setAttribute("src","./assets/img/lifes-good-campaign-2025-live-human-lgcom-gate-img-red-point.svg");
      };
    },

    // 태블릿 (1439px ~ 769px)
    "(min-width: 769px) and (max-width: 1439px)": function() {
      // 미디어 쿼리 활성화 시 기본 이미지 설정
      redPoint.classList.remove('active');
      redPoint.setAttribute("src","./assets/img/lifes-good-campaign-2025-live-human-lgcom-gate-img-red-point.svg");

      const articleBanner = gsap.timeline({
        scrollTrigger: {
          trigger: ".section.article-banner",
          start: "350%",
          end: "10%",
          scrub: 1,
          onEnter: function() {
            articleBannerAnimation.classList.add('active');
          },
          onLeaveBack: function() {
            articleBannerAnimation.classList.remove('active');
          },
        },
      });

      const heroVisual = gsap.timeline({
        scrollTrigger: {
          trigger: ".section.overview",
          start: "top top",
          end: "+=300%",
          pin: true,
          scrub: 1,
          onLeave: function() {
            redPoint.classList.add('active');
            redPoint.setAttribute("src","./assets/img/lifes-good-campaign-2025-live-human-lgcom-gate-img-ai-symbol.gif");
          },
          onEnterBack: function() {
            redPoint.classList.remove('active');
            redPoint.setAttribute("src","./assets/img/lifes-good-campaign-2025-live-human-lgcom-gate-img-red-point.svg");
          },
        },
      });

      heroVisual
        .addLabel('imgShow')
        .to(img01, { x: "-40vw", y: "-32.8svh", scale: 0.425 }, "imgShow")
        .to(img03, { x: "38.5vw", y: "-32.8svh", scale: 0.51 }, "imgShow")
        .to(img05, { x: "40vw", y: "32.8svh", scale: 0.425 }, "imgShow")
        .to(img06, { x: "-38.5vw", y: "32.8svh", scale: 0.51 }, "imgShow")
        .to(title1, { opacity: 1, y: 0 })
        .to(txt1, { opacity: 1, y: 0 })
        .addLabel('txtFade')
        .to(title1, { opacity: 0 }, "txtFade")
        .to(txt1, { opacity: 0 }, "txtFade")
        .to(txt2, { opacity: 1, y: 0 })
        .to(title2, { opacity: 1, y: 0 })
        .to(redPoint, { width: 8, scale:1, opacity: 0.5, duration:2 });

      // 클린업 함수 (필요 시)
      return () => {
        // 예: redPoint 기본 상태로 복원
        redPoint.classList.remove('active');
        redPoint.setAttribute("src","./assets/img/lifes-good-campaign-2025-live-human-lgcom-gate-img-red-point.svg");
      };
    },

    // 모바일 (768px 이하)
    "(max-width: 768px)": function() { // max-width 수정
      // 미디어 쿼리 활성화 시 기본 이미지 설정
      redPoint.classList.remove('active');
      redPoint.setAttribute("src","./assets/img/lifes-good-campaign-2025-live-human-lgcom-gate-img-red-point.svg");
      
      const articleBanner = gsap.timeline({
        scrollTrigger: {
          trigger: ".section.article-banner",
          start: "350%",
          end: "10%",
          scrub: 1,
          onEnter: function() {
            articleBannerAnimation.classList.add('active');
          },
          onLeaveBack: function() {
            articleBannerAnimation.classList.remove('active');
          },
        },
      });

      const heroVisual = gsap.timeline({
        scrollTrigger: {
          trigger: ".section.overview",
          start: "top top",
          end: "+=300%",
          pin: true,
          scrub: 1,
          onLeave: function() {
            redPoint.classList.add('active');
            redPoint.setAttribute("src","./assets/img/lifes-good-campaign-2025-live-human-lgcom-gate-img-ai-symbol.gif");
          },
          onEnterBack: function() {
            redPoint.classList.remove('active');
            redPoint.setAttribute("src","./assets/img/lifes-good-campaign-2025-live-human-lgcom-gate-img-red-point.svg");
          },
        },
      });

      heroVisual
        .addLabel('imgShow')
        .to(img01, { x: "-36vw", y: "-40lvh", scale: 0.44 }, "imgShow")
        .to(img03, { x: "35vw", y: "-42lvh", scale: 0.49 }, "imgShow")
        .to(img05, { x: "36vw", y: "42lvh", scale: 0.44 }, "imgShow")
        .to(img06, { x: "-35vw", y: "39lvh", scale: 0.49 }, "imgShow")
        .to(title1, { opacity: 1, y: 0 })
        .to(txt1, { opacity: 1, y: 0 })
        .addLabel('txtFade')
        .to(title1, { opacity: 0 }, "txtFade")
        .to(txt1, { opacity: 0 }, "txtFade")
        .to(txt2, { opacity: 1, y: 0 })
        .to(title2, { opacity: 1, y: 0 })
        .to(redPoint, { opacity: 0.5 })
        .to(redPoint, { width: 8, scale:1, opacity: 0.5, duration:2 });

      // 클린업 함수 (필요 시)
      return () => {
        // 예: redPoint 기본 상태로 복원
        redPoint.classList.remove('active');
        redPoint.setAttribute("src","./assets/img/lifes-good-campaign-2025-live-human-lgcom-gate-img-red-point.svg");
      };
    },
  });

  

  const contentList = document.querySelectorAll(".section.intelligence ul li");
  const contentBoxes = document.querySelectorAll(".content-bx");

  // 초기 창 너비 상태 (true: PC, false: 모바일)
  let isPC = window.innerWidth > 1025;

  // 콘텐츠 업데이트 함수
  function updateContentBoxes() {
    contentBoxes.forEach(function (box, index) {
      const videoName = box.dataset.videoName; // 비디오 파일 이름
      const imgName = box.dataset.imgName; // poster 이미지 이름
      const altName = box.dataset.alt; // aria-label 이름

      // 현재 창 너비에 따른 콘텐츠 설정
      let videoHTML;
      if (window.innerWidth > 1025) {
        videoHTML = `
          <video muted playsinline loop poster="./assets/img/${imgName}.jpg" aria-label="${altName}">
            <source src="./assets/video/${videoName}-desktop.mp4">
          </video>
          <button type="button" class="play-btn" role="button" tabindex="0" aria-pressed="false"></button>
        `;
      } else {
        videoHTML = `
          <video autoplay muted playsinline loop aria-label="${altName}">
            <source src="./assets/video/${videoName}-mobile.mp4">
          </video>
          <button type="button" class="play-btn" role="button" tabindex="0" aria-pressed="false"></button>
        `;
      }

      // 콘텐츠가 동일한지 확인하여 불필요한 업데이트 방지
      if (box.innerHTML !== videoHTML) {
        box.innerHTML = videoHTML;

        // 버튼과 비디오 요소 선택
        const playBtn = box.querySelector('.play-btn');
        const video = box.querySelector('video');

        // 초기 상태에 따라 버튼 활성화 설정
        if (isPC) {
          if (video.paused) {
            playBtn.classList.remove('active');
          } else {
            playBtn.classList.add('active');
          }
        } else {
          // 모바일: 비디오가 자동 재생되므로 active 클래스 추가
          playBtn.classList.add('active');
        }

        // 버튼 클릭 이벤트 리스너 추가
        playBtn.addEventListener('click', function () {
          const isPressed = this.getAttribute('aria-pressed') === 'true';
          this.setAttribute('aria-pressed', String(!isPressed));
          if (video.paused) {
            video.play();
            playBtn.classList.add('active');
          } else {
            video.pause();
            playBtn.classList.remove('active');
          }
        });

        // 마우스 오버 및 아웃 이벤트 리스너 추가 (PC 사이즈일 때만)
        if (isPC) {
          const li = contentList[index];
          
          // 기존 이벤트 리스너 제거 (중복 방지)
          li.removeEventListener("mouseenter", handleContentMouseEnter);
          li.removeEventListener("mouseleave", handleContentMouseLeave);
          
          // 이벤트 핸들러 정의
          function handleContentMouseEnter() {
            video.play();
            playBtn.classList.add('active');
            playBtn.setAttribute('aria-pressed', "true");
          }

          function handleContentMouseLeave() {
            video.pause();
            video.currentTime = 0;
            playBtn.classList.remove('active');
            playBtn.setAttribute('aria-pressed', "false");
          }

          // 새로운 이벤트 리스너 추가
          li.addEventListener("mouseenter", handleContentMouseEnter);
          li.addEventListener("mouseleave", handleContentMouseLeave);
        }
      }
    });
  }

  // 디바운스 함수
  function debounce(func, delay) {
    let timer;
    return function () {
      clearTimeout(timer);
      timer = setTimeout(func, delay);
    };
  }

  // 창 너비 상태 변경 여부 확인 후 업데이트 (Renamed to handleContentResize)
  function handleContentResize() {
    const currentlyPC = window.innerWidth > 1025;
    if (currentlyPC !== isPC) {
      isPC = currentlyPC;
      updateContentBoxes();
    }
  }

  // 초기 실행
  updateContentBoxes();

  // 리사이즈 이벤트 (가로 크기 변경 시에만 업데이트) - using debounce
  window.addEventListener("resize", debounce(handleContentResize, 200));

  /* storySlide 슬라이드 */
  let storySlide = null;
  
  // Renamed function to handleStorySlideResize
  function handleStorySlideResize() {
    let isMobileView = window.innerWidth <= 769;
    if (isMobileView && !storySlide) {
      storySlide = new Swiper(".stories .swiper", {
        slidesPerView: 1.2,
        spaceBetween: 10,
        speed: 1000,
        navigation: {
          nextEl: ".stories .slide-button-next",
          prevEl: ".stories .slide-button-prev",
        },
        a11y: {
          nextSlideMessage: 'move to next slide',
          prevSlideMessage: 'move to prev slide',
        },
      });
    }
    else if (!isMobileView && storySlide) {
      // 1025px 초과일 때 슬라이드 제거
      storySlide.destroy();
      storySlide = null;
    }
  }

  // Initial call
  handleStorySlideResize();

  // Event listener for storySlide resize
  window.addEventListener("resize", function() {
    handleStorySlideResize();
  });

  /* 팝업 스크립트 */
  const popShowBtn = document.querySelector(".popup-show");
  const layerPop = document.querySelector(".layer-pop");
  const iframe = layerPop.querySelector(".iframe-bx");
  const closeBtn = layerPop.querySelector(".close-btn");

  // 팝업 열기
  popShowBtn.addEventListener("click", function () {
    const youtubeId = this.dataset.ytid;
    // iframe의 src 속성 설정
    iframe.innerHTML = `<iframe src="https://www.youtube.com/embed/${youtubeId}?autoplay=1&mute=1?enablejsapi=1" title="LG VS Company : CES 2025 Teaser I LG​" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>`;
    // 팝업 활성화
    layerPop.classList.add("active");
    closeBtn.focus();
  });

  // 팝업 닫기
  closeBtn.addEventListener("click", function () {
    iframe.innerHTML = "";
    layerPop.classList.remove("active");
    popShowBtn.focus();
  });

  // 헤더 요소 선택
  const mobileHeader = document.querySelector('.c-gnb__mobile .c-gnb__sticky');
  const pcHeader = document.querySelector('.c-gnb__desktop .c-gnb__sticky');
  
  // Select the c-header-side element
  const cHeaderSide = document.querySelector('.c-header-side');

  // Removed lastScrollTop as it's no longer needed

  // 뷰포트 너비를 감지하는 함수
  function getHeaderHeight() {
    if (window.innerWidth >= 1440) {
      return pcHeader ? pcHeader.offsetHeight : 0;
    } else {
      return mobileHeader ? mobileHeader.offsetHeight : 0;
    }
  }

  // [PC에서만 조정 가능하도록 만든 변수]
//   - pcScrollThreshold: intelligence 섹션이 '뷰포트 상단'으로부터 얼마만큼 아래에 있을 때 Sticky를 활성화할지를 결정
//   - 예) 200 이면, 뷰포트 상단에서 200px 떨어진 순간부터 Sticky가 적용됩니다.
const pcScrollThreshold = 200;

// Sticky Header 스크롤 이벤트
function handleStickyHeaderScroll() {
  if (!cHeaderSide) return;

  const intelligence = document.querySelector('.intelligence');
  const sticky = document.querySelector('.intelligence .sticky');
  const intelligencePosition = intelligence.getBoundingClientRect();

  // 헤더 높이 (모바일/PC 분기)
  const headerHeight = getHeaderHeight() - 1;

  // PC 해상도인지 여부
  const isPCWidth = window.innerWidth >= 1440;

  // 만약 .c-header-side에 is-fixed 클래스가 있다면(= 스크롤 업 중인 상태)
  if (cHeaderSide.classList.contains('is-fixed')) {
    if (isPCWidth) {
      // [*수정*] PC 해상도에서 threshold 적용
      if (intelligencePosition.top < pcScrollThreshold) {
        sticky.classList.add('active');
        sticky.style.top = `${headerHeight}px`;
      } else {
        sticky.classList.remove('active');
        sticky.style.top = '0px';
      }
    } else {
      // 모바일/태블릿 로직 (원래처럼)
      if (intelligencePosition.top < 0) {
        sticky.classList.add('active');
        sticky.style.top = `${headerHeight}px`;
      } else {
        sticky.classList.remove('active');
        sticky.style.top = '0px';
      }
    }
  } 
  else {
    // 스크롤 다운 중인 상태
    if (isPCWidth) {
      // [*수정*] PC 해상도에서 threshold 적용
      if (intelligencePosition.top < pcScrollThreshold) {
        sticky.classList.add('active');
        sticky.style.top = '0px';
      } else {
        sticky.classList.remove('active');
        sticky.style.top = '0px';
      }
    } else {
      // 모바일/태블릿 로직 (원래처럼)
      if (intelligencePosition.top < 0) {
        sticky.classList.add('active');
        sticky.style.top = '0px';
      } else {
        sticky.classList.remove('active');
        sticky.style.top = '0px';
      }
    }
  }
}


  // 리사이즈 이벤트 핸들러 for Sticky Header (Renamed to handleStickyHeaderResize)
  function handleStickyHeaderResize() {
    const intelligence = document.querySelector('.intelligence');
    const sticky = document.querySelector('.intelligence .sticky');
    const intelligencePosition = intelligence.getBoundingClientRect();

    if (intelligencePosition.top < 0 && sticky.classList.contains('active')) {
      const headerHeight = getHeaderHeight();
      sticky.style.top = `${headerHeight - 1}px`;
    } else {
      sticky.style.top = '0px';
    }
  }

  // Throttle 함수 (성능 최적화를 위해 스크롤 이벤트 빈도 조절)
  function throttle(fn, wait) {
    let lastTime = 0;
    return function(...args) {
      const now = new Date().getTime();
      if (now - lastTime >= wait) {
        fn.apply(this, args);
        lastTime = now;
      }
    };
  }

  // 이벤트 리스너 등록
  window.addEventListener('scroll', throttle(handleStickyHeaderScroll, 100)); // 100ms 간격으로 실행
  window.addEventListener('resize', throttle(handleStickyHeaderResize, 100)); // 리사이즈 시에도 처리

});

// Refresh ScrollTrigger on window load
window.addEventListener('load', function() {
  ScrollTrigger.refresh();
});
