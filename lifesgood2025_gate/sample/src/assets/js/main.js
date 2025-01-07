document.addEventListener("DOMContentLoaded", function () {
  const heroVideoBx = document.querySelector(".hero-visual .video-bx");
  const heroToggleBtn = document.querySelector(".play-btn");
  let currentVideoSrc = "";

  // 영상을 동적으로 설정하는 함수
  function setHeroVideo() {
    const isDesktop = window.innerWidth > 1025;
    const newVideoSrc = isDesktop
      ? "./assets/video/hero_video_pc.mp4"
      : "./assets/video/hero_video_m.mp4";

    // 현재 영상이 변경된 경우에만 업데이트
    if (currentVideoSrc !== newVideoSrc) {
      heroVideoBx.innerHTML = `
        <video autoplay muted playsinline loop>
          <source src="${newVideoSrc}">
        </video>
      `;
      currentVideoSrc = newVideoSrc;
    };
  };

  // 초기 영상 설정
  setHeroVideo();

  // 디바운싱된 리사이즈 이벤트 핸들러
  let resizeTimeout;
  window.addEventListener("resize", function () {
    clearTimeout(resizeTimeout);
    resizeTimeout = setTimeout(setHeroVideo, 150); // 150ms 딜레이로 디바운스
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

  gsap.registerPlugin(ScrollTrigger);

  const symbol = document.querySelector(".logo-wrap .symbol");
  const gif = document.querySelector(".intelligence .gif");
  // const img01 = document.querySelector(".overview .img-list .img01");
  // const img02 = document.querySelector(".overview .img-list .img02");

  // 타임라인 생성 함수
  gsap.registerPlugin(ScrollTrigger);

  // ScrollTrigger의 matchMedia를 사용하여 미디어 쿼리 적용
  ScrollTrigger.matchMedia({
    "(min-width: 1025px)": function() {
      const heroVisual = gsap.timeline({
        scrollTrigger: {
          trigger: ".section.overview",
          start: "top top",
          end: "+=120%",
          pin: true,
          scrub: 1,
          onLeave: function() {
            gif.classList.add('active');
            symbol.classList.add('active');
          },
          onEnterBack: function() {
            gif.classList.remove('active');
            symbol.classList.remove('active');
          },
        },
      });
    
      heroVisual
        // .addLabel('imgShow')
        // .to(img01,{
        //   x : "-25vw",
        //   y : "-30svh",
        //   scale: 1,
        // }, "imgShow")
        // .to(img02,{
        //   x : "25vw",
        //   y : "25svh",
        //   scale: 1,
        // }, "imgShow")
        .to(symbol, {
          scale: 2,
          opacity: 1,
        })
        .to(symbol, {
          scale: 0.05,
        })
        .to(symbol, {
          y: "9.5rem",
        });
    },
  });

  const contentList = document.querySelectorAll(".section.intelligence ul li");
  const contentBoxes = document.querySelectorAll(".content-bx");

  // 콘텐츠 업데이트 함수
  function updateContentBoxes() {
    contentBoxes.forEach(function (box) {
      const videoName = box.dataset.videoName; // 비디오 파일 이름
      const imgName = box.dataset.imgName; // poster 이미지 이름
      const altName = box.dataset.alt; // aria-label 이름

      // pc 사이즈일 경우
      if (window.innerWidth > 1025) {
        box.innerHTML = `
          <video muted playsinline loop poster="./assets/img/${imgName}.jpg" aria-label="${altName}">
            <source src="./assets/video/${videoName}.mp4">
          </video>
        `;
      } 
      // 모바일 사이즈일 경우
      else {
        box.innerHTML = `
          <video autoplay muted playsinline loop aria-label="${altName}">
            <source src="./assets/video/${videoName}_m.mp4">
          </video>
        `;
      }
    });
  };

  // 디바운스 함수
  function debounce(func, delay) {
    let timer;
    return function () {
      clearTimeout(timer);
      timer = setTimeout(func, delay);
    };
  };

  // 초기 실행
  updateContentBoxes();

  // 리사이즈 이벤트
  window.addEventListener("resize", debounce(updateContentBoxes, 200));

  contentList.forEach(function (li, index) {
    li.addEventListener("mouseenter", function () {
      const video = contentBoxes[index].querySelector("video");
      if (window.innerWidth > 1025) {
        video.setAttribute("autoplay", "autoplay");
        video.play();
      }
    });
    li.addEventListener("mouseleave", function () {
      const video = contentBoxes[index].querySelector("video");
      if (window.innerWidth > 1025) {
        video.removeAttribute("autoplay");
        video.pause();
        video.currentTime = 0;
      }
    });
  });

  /* storySlide 슬라이드 */
  let storySlide = null;
  function handleResize() {
      let isMobileView = window.innerWidth <= 1025;
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
  handleResize();
  window.addEventListener("resize", handleResize);

  /*팝업 스크립트 */
  const popShowBtn = document.querySelector(".popup-show");
  const layerPop = document.querySelector(".layer-pop");
  const iframe = layerPop.querySelector(".iframe-bx");
  const closeBtn = layerPop.querySelector(".close-btn");

  // 팝업 열기
  popShowBtn.addEventListener("click", function () {
    const youtubeId = this.dataset.ytid;
    // iframe의 src 속성 설정
    iframe.innerHTML = `<iframe src="https://www.youtube.com/embed/${youtubeId}?autoplay=1&mute=1" title="LG VS Company : CES 2025 Teaser I LG​" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>`;
    // 팝업 활성화
    layerPop.classList.add("active");
    closeBtn.focus();
  });
  closeBtn.addEventListener("click", function () {
    iframe.innerHTML = "";
    layerPop.classList.remove("active");
    popShowBtn.focus();
  });
});