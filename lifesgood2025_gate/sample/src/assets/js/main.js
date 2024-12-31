document.addEventListener("DOMContentLoaded", function () {
  const heroVideo = document.querySelector(".hero-visual video");
  const heroToggleBtn = document.querySelector(".play-btn");
  heroToggleBtn.addEventListener("click", function () {
    if (this.classList.contains("active")) {
      this.classList.remove("active");
      heroVideo.play();
    } else {
      this.classList.add("active");
      heroVideo.pause();
    }
  });

  gsap.registerPlugin(ScrollTrigger);
  ScrollTrigger.matchMedia({
    // PC용 스크롤 트리거
    "(min-width: 1025px)": function () {
      const secOverflow = document.querySelector("section.overview");
      const symbol = document.querySelector(".logo-wrap.png-bx .symbol");
      const symbolGif = document.querySelector(".logo-wrap.gif-bx .gif");
      const heroVisual1 = gsap.timeline({
        scrollTrigger: {
          trigger: ".overview .inner",
          scrub: 1,
          pin:true,
          duration: 1,
          onLeave: function () {
            symbol.classList.add("hide");
            symbolGif.classList.add("active");
            symbolGif.src = "./assets/images/icon/ai_symbol.gif";
          },
          onEnterBack: function () {
            symbol.classList.remove("hide");
            symbolGif.classList.remove("active");
            symbolGif.src = "./assets/images/icon/ai_symbol.png";
          },
        },
      });

      heroVisual1
      .addLabel("fadeIn")
        .to(symbol, {
          scale: 44.44,
        }, "fadeIn")
        .to(symbol, {
          opacity: 1,
        }, "fadeIn")
        .to(symbol, {
          scale: 4,
          filter: "blur(20px)",
        })
        .addLabel("logoChange")
        .to(symbol, {
            scale: 1,
            filter: "blur(0px)",
            transform: "translate(-50%, 0)",
            marginTop: "4.5rem",
          },"logoChange")
        .to(secOverflow, {
            overflow: "unset",
          },"logoChange")
    },

    // 모바일용 스크롤 트리거
    "(max-width: 1024px)": function () {
      const symbolGif = document.querySelector(".logo-wrap.gif-bx .gif");
      symbolGif.src = "./assets/images/icon/ai_symbol.gif";
    },
  });

  const contentList = document.querySelectorAll(".section.intelligence ul li");
  const contentBoxes = document.querySelectorAll(".content-bx");
  /*커텐트 박스 pc / m 초기 inner 사이즈에 따른 출력 값 */
  contentBoxes.forEach(function(box){
      const videoName = box.dataset.videoName; // 비디오 파일 이름
      const imgName = box.dataset.imgName; // poster 이미지 이름
      const altName = box.dataset.alt; // aria-label 이름
      /* pc 사이즈 일 경우 */
      if (window.innerWidth > 1025) {
        box.innerHTML= `
          <video muted playsinline loop poster="./assets/images/main/${imgName}.jpg" aria-label="${altName}" preload="none">
            <source src="./assets/video/${videoName}.mp4">
          </video>
        `;
      }
      /* 모바일 사이즈 일 경우 */
      else {
        box.innerHTML= `
          <video autoplay muted playsinline loop aria-label="${altName}" preload="none">
            <source src="./assets/video/m/${videoName}.mp4">
          </video>
        `;
      }
  });

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

  const heroVideos = document.querySelector(".hero-visual .video-bx video");

  const fillTxt = document.querySelector(".lifesgood .txt-bx .title");
  // 자식 노드 순회하며 <span> 태그로 감싸기
  const wrappedText = Array.from(fillTxt.childNodes)
    .map((node) => {
      if (node.nodeType === Node.TEXT_NODE) {
        // 텍스트 노드의 내용을 글자 단위로 <span> 감싸기
        return node.textContent
          .split("")
          .map((char) => `<span aria-hidden="true">${char}</span>`)
          .join("");
      } else if (node.nodeType === Node.ELEMENT_NODE && node.tagName === "BR") {
        // <br> 태그는 그대로 유지
        return "<br>";
      }
      return ""; // 기타 노드는 무시
    })
    .join("");

  // HTML 내용으로 다시 삽입
  fillTxt.innerHTML = wrappedText;

  window.addEventListener("scroll", function () {
    const target = document.querySelector(".lifesgood");
    const targetPosition = target.getBoundingClientRect().top; // 요소의 페이지에서의 위치
    const targetHeight = target.offsetHeight; // 요소의 높이
    // 현재 스크롤 위치가 target 요소의 영역에 들어갔을 때
    if (targetPosition < targetHeight / 2) {
      target.classList.add("active"); // 활성화 클래스 추가
    } else {
      target.classList.remove("active"); // 활성화 클래스 추가
    }
  });

  /* storySlide 슬라이드 */
  let storySlide = null;
  function handleResize() {
    let isMobileView = window.innerWidth <= 1025;
    if (isMobileView && !storySlide) {
      storySlide = new Swiper(".stories .swiper", {
        slidesPerView: 1.1,
        spaceBetween: 10,
        speed: 1000,
        navigation: {
          nextEl: ".stories .slide-button-next",
          prevEl: ".stories .slide-button-prev",
        },
        a11y: {
          nextSlideMessage: "move to next slide",
          prevSlideMessage: "move to prev slide",
        },
      });
    } else if (!isMobileView && storySlide) {
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