/* fade-up 클래스를 가진 요소들을 Intersection Observer로 감지하여 애니메이션 적용 */
function initFadeUp() {
  const fadeUpElements = document.querySelectorAll(".fade-in, .fade-in-up");

  if (fadeUpElements.length === 0) return;

  // 부모 요소별로 그룹화
  const parentGroups = new Map();

  fadeUpElements.forEach((element) => {
    // 부모 요소 찾기 (data-fade-group이 있으면 그것을 기준으로, 없으면 가장 가까운 공통 부모)
    let parent = element.parentElement;
    let groupKey = null;

    while (parent && parent !== document.body) {
      if (parent.hasAttribute("data-fade-group")) {
        groupKey = parent.getAttribute("data-fade-group");
        break;
      }
      // text-wrap, inner, section 등을 기준으로 그룹화
      if (
        parent.classList.contains("text-wrap") ||
        parent.classList.contains("inner") ||
        parent.tagName === "SECTION"
      ) {
        // 같은 부모를 가진 요소들을 하나의 그룹으로
        groupKey = parent;
        break;
      }
      parent = parent.parentElement;
    }

    // 그룹 키가 없으면 요소의 직접 부모 사용
    if (!groupKey) {
      groupKey = element.parentElement || "default";
    }

    if (!parentGroups.has(groupKey)) {
      parentGroups.set(groupKey, []);
    }

    parentGroups.get(groupKey).push({
      element: element,
      delay: element.hasAttribute("data-delay")
        ? parseFloat(element.getAttribute("data-delay"))
        : null,
    });
  });

  // 각 그룹별로 transition-delay 설정
  const groupObservers = new Map();

  parentGroups.forEach((group, groupKey) => {
    // 같은 그룹 내의 요소들을 DOM 순서대로 정렬
    const sortedElements = group.sort((a, b) => {
      const position = a.element.compareDocumentPosition(b.element);
      return position & Node.DOCUMENT_POSITION_FOLLOWING ? -1 : 1;
    });

    sortedElements.forEach((item, index) => {
      const { element, delay } = item;

      // data-delay가 명시적으로 지정되어 있지 않은 경우, 인덱스에 따라 자동 딜레이 적용
      const finalDelay = delay !== null ? delay : index * 0.15; // 기본 딜레이 간격: 0.15초

      // CSS transition-delay 설정
      element.style.transitionDelay = `${finalDelay}s`;

      // 그룹 정보를 요소에 저장 (나중에 참조하기 위해)
      element.dataset.fadeGroupKey = groupKey.toString();
    });

    // 페이지 로드 시 각 요소의 위치를 개별적으로 확인
    // 뷰포트 위로 완전히 지나간 요소는 즉시 활성화
    sortedElements.forEach((item) => {
      const rect = item.element.getBoundingClientRect();

      // 요소가 뷰포트 위로 완전히 지나갔으면 즉시 활성화
      if (rect.bottom < 0) {
        item.element.classList.add("is-visible");
        item.isPastViewport = true;
      } else {
        item.isPastViewport = false;
      }
    });

    // 아직 안 보이는 요소들만 필터링
    const elementsToObserve = sortedElements.filter(
      (item) => !item.isPastViewport
    );

    // 관찰할 요소가 있는 경우에만 Intersection Observer 설정
    if (elementsToObserve.length > 0) {
      const observerOptions = {
        root: null,
        rootMargin: "0px",
        threshold: 0.15, // 요소의 15%가 보이면 트리거
      };

      const observer = new IntersectionObserver((entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            // 해당 요소에 is-visible 클래스 추가
            entry.target.classList.add("is-visible");
            // 해당 요소는 더 이상 관찰하지 않음
            observer.unobserve(entry.target);
          }
        });
      }, observerOptions);

      // 아직 안 보이는 요소들을 개별적으로 관찰
      elementsToObserve.forEach((item) => {
        observer.observe(item.element);
      });

      groupObservers.set(groupKey, observer);
    }
  });
}

/* KV 영상 재생 제어 */
const KV_BREAKPOINT = 768; // 모바일 기준점 (px)
let kvVideo = null;
let isKVIntroComplete = false;
let kvResizeTimer = null;
let currentPlayPromise = null; // 진행 중인 비디오 재생 Promise 추적
let isKVVideoInitialized = false; // KV 비디오 초기화 완료 상태 추적

/* 현재 화면 크기에 따른 모바일 여부 판단 */
function isMobile() {
  return window.innerWidth <= KV_BREAKPOINT;
}

/* 현재 화면 크기에 맞는 영상 파일 경로 반환 */
function getVideoPath(type) {
  const isMob = isMobile();
  const prefix = isMob ? "kv_" + type + "_m" : "kv_" + type;
  const devicePath = isMob ? "m" : "w";
  return `/theme/rbFront/img/${devicePath}/ise/ise2026/${prefix}.mp4`;
}

/* 영상 소스 변경 (단순 소스 교체 방식) */
async function changeVideoSource(videoPath, shouldLoop) {
  if (!kvVideo) return;

  // 진행 중인 재생 작업이 있으면 완료 대기
  if (currentPlayPromise) {
    try {
      await currentPlayPromise;
    } catch (err) {
      // AbortError는 정상적인 동작이므로 무시
      if (err.name !== "AbortError") {
        console.warn("Previous play promise rejected:", err);
      }
    }
  }

  // 기존 이벤트 리스너 제거
  kvVideo.removeEventListener("ended", handleIntroComplete);

  // 비디오 일시정지
  kvVideo.pause();

  // 소스 변경
  kvVideo.src = videoPath;
  kvVideo.loop = shouldLoop;

  // 새 영상이 로드되면 재생
  const handleCanPlay = () => {
    currentPlayPromise = kvVideo
      .play()
      .then(() => {
        currentPlayPromise = null;
      })
      .catch((err) => {
        currentPlayPromise = null;
        // AbortError는 정상적인 동작이므로 무시
        if (err.name !== "AbortError") {
          console.warn("Video play failed:", err);
        }
      });
  };

  // 에러 처리
  const handleError = () => {
    console.warn("Video load failed:", videoPath);
  };

  // 이벤트 리스너 등록
  kvVideo.addEventListener("canplaythrough", handleCanPlay, { once: true });
  kvVideo.addEventListener("error", handleError, { once: true });

  // intro 영상인 경우 ended 이벤트 리스너 추가
  if (!isKVIntroComplete) {
    kvVideo.addEventListener("ended", handleIntroComplete, { once: false });
  }

  // 비디오 로드 시작
  kvVideo.load();
}

/* intro 영상 재생 완료 후 default 영상으로 전환 */
function handleIntroComplete() {
  if (isKVIntroComplete) return;

  isKVIntroComplete = true;
  const defaultVideoPath = getVideoPath("default");
  changeVideoSource(defaultVideoPath, true); // default 영상은 반복 재생
}

/* 화면 크기 변경 시 영상 재설정 */
function handleKVResize() {
  // 초기화가 완료되지 않았으면 리사이즈 처리 건너뛰기
  if (!isKVVideoInitialized) return;

  // 디바운스 처리
  clearTimeout(kvResizeTimer);
  kvResizeTimer = setTimeout(() => {
    if (!kvVideo) return;

    const wasIntroComplete = isKVIntroComplete;
    const currentVideoPath = kvVideo.src;
    const currentIsMobile = currentVideoPath.includes("_m.mp4");
    const newIsMobile = isMobile();

    // 모바일/데스크톱 전환이 발생한 경우에만 영상 변경
    if (currentIsMobile !== newIsMobile) {
      if (wasIntroComplete) {
        // default 영상으로 변경
        const defaultVideoPath = getVideoPath("default");
        changeVideoSource(defaultVideoPath, true);
      } else {
        // intro 영상부터 다시 시작
        isKVIntroComplete = false;
        const introVideoPath = getVideoPath("intro");
        changeVideoSource(introVideoPath, false);
      }
    }
  }, 250); // 250ms 디바운스
}

/* KV 영상 초기화 */
function initKVVideo() {
  const videoBx = document.querySelector(".kv .video-bx");
  if (!videoBx) return;

  kvVideo = videoBx.querySelector("video");
  if (!kvVideo) return;

  // 초기 intro 영상 경로
  const introVideoPath = getVideoPath("intro");

  // 1. 즉시 autoplay 비활성화 (추가 재생 시도 방지)
  kvVideo.autoplay = false;

  // 2. 비디오 속성 설정
  kvVideo.loop = false; // intro는 반복하지 않음
  kvVideo.muted = true;
  kvVideo.playsInline = true;
  kvVideo.preload = "auto";

  // 3. CSS transition을 위한 스타일 설정
  kvVideo.style.position = "relative";
  kvVideo.style.transition = "opacity 0.3s ease-in-out";
  kvVideo.style.display = "block";
  kvVideo.style.width = "100%";
  kvVideo.style.height = "100%";
  kvVideo.style.objectFit = "contain";
  kvVideo.style.zIndex = "1";

  // 4. 기존 비디오 안전하게 정리 (비동기 처리)
  const stopExistingPlayback = () => {
    return new Promise((resolve) => {
      // 재생 중인 경우 일시정지
      if (!kvVideo.paused) {
        kvVideo.pause();
      }

      // 기존 소스 완전 제거
      kvVideo.removeAttribute("src");
      const sources = kvVideo.querySelectorAll("source");
      sources.forEach((source) => source.remove());
      kvVideo.load(); // 기존 로드 완전히 정리

      // 다음 이벤트 루프에서 resolve (정리 완료 보장)
      setTimeout(resolve, 0);
    });
  };

  // 5. 비동기로 안전하게 정리 후 초기화
  stopExistingPlayback().then(() => {
    // 6. 이벤트 리스너 등록
    const handleCanPlay = () => {
      // Chrome 권장: play() Promise를 명시적으로 처리
      const playPromise = kvVideo.play();

      if (playPromise !== undefined) {
        playPromise
          .then(() => {
            currentPlayPromise = null;
            // 첫 재생 성공 후 초기화 완료 플래그 설정 및 리사이즈 리스너 등록
            if (!isKVVideoInitialized) {
              isKVVideoInitialized = true;
              window.addEventListener("resize", handleKVResize);
            }
          })
          .catch((err) => {
            currentPlayPromise = null;
            // AbortError는 정상적인 중단이므로 무시
            if (err.name !== "AbortError") {
              console.warn("Video autoplay failed:", err);
            }
          });

        currentPlayPromise = playPromise;
      }
    };

    kvVideo.addEventListener("canplaythrough", handleCanPlay, { once: true });
    kvVideo.addEventListener(
      "error",
      () => {
        console.warn("Video load failed:", introVideoPath);
      },
      { once: true }
    );
    kvVideo.addEventListener("ended", handleIntroComplete, { once: false });

    // 7. 새 소스 설정 (이것만으로 브라우저가 자동으로 로드 시작)
    kvVideo.src = introVideoPath;
  });
}

/* Booth 이미지 슬라이드 자동 전환 */
let boothSlideInterval = null;
let currentBoothIndex = 0;

function initBoothSlide() {
  const boothSlides = document.querySelectorAll(".booth-map .img-list li");

  if (boothSlides.length === 0) return;

  // 자동 슬라이드 전환 함수
  function nextSlide() {
    // 현재 활성화된 슬라이드의 active 클래스 제거
    boothSlides[currentBoothIndex].classList.remove("active");

    // 다음 인덱스 계산
    currentBoothIndex = (currentBoothIndex + 1) % boothSlides.length;

    // 다음 슬라이드에 active 클래스 추가
    boothSlides[currentBoothIndex].classList.add("active");
  }

  // 3초마다 자동 전환
  boothSlideInterval = setInterval(nextSlide, 1500);
}

/* footer 네비게이션 버튼 클릭 이벤트 */
function handleFooterNavClick() {
  const footerNavLinks = document.querySelectorAll(
    ".ise-footer .nav-link[data-section]"
  );

  if (footerNavLinks.length === 0) return;

  // 섹션 매핑
  const sectionMap = new Map();
  const sections = document.querySelectorAll(
    ".kv, .overview, .inspiration, .invitation, .faq"
  );

  sections.forEach((section) => {
    const sectionClass = section.className
      .split(" ")
      .find((cls) =>
        ["kv", "overview", "inspiration", "invitation", "faq"].includes(cls)
      );
    if (sectionClass) {
      sectionMap.set(sectionClass, section);
    }
  });

  // 각 버튼에 클릭 이벤트 리스너 추가
  footerNavLinks.forEach((button) => {
    button.addEventListener("click", () => {
      const sectionClass = button.getAttribute("data-section");
      const targetSection = sectionMap.get(sectionClass);

      if (targetSection) {
        // 부드러운 스크롤
        targetSection.scrollIntoView({
          behavior: "smooth",
          block: "start",
        });
      }
    });
  });
}

function handleBoothSlide() {
  const boothSlide = document.querySelector(".booth-map .slide-bx");

  // 각 슬라이드에 표시할 커스텀 텍스트 배열 (사용자가 원하는 대로 수정 가능)
  const boothSlideTexts = ["Hall", "Key<br>attractor", "LG Business<br>solutions", "K-Culture<br>shop", "Drive-<br class='pc-only'>thru", "Meeting<br>room", "Control<br>room", "E-Paper<br>display", "Learning<br>zone", "Hotel", "LED tech<br>zone"];

  const boothSlideSwiper = new Swiper(boothSlide, {
    slidesPerView: 1,
    spaceBetween: 20,
    loop: true,
    speed: 1000,
    effect: "fade",
    pagination: {
      el: ".booth-map .slide-bx .swiper-pagination",
      type: "bullets",
      clickable: true,
      renderBullet: function (index, className) {
        // 번호: 첫 번째는 'H', 나머지는 모바일에서는 '1', '2', '3', 데스크탑에서는 '01', '02', '03' 형식
        const isMobile = window.matchMedia('(max-width: 767px)').matches;
        const bulletNum = index === 0 ? "H" : (isMobile ? String(index) : String(index).padStart(2, "0"));
        // 커스텀 텍스트
        const bulletText = boothSlideTexts[index] || "";
        // 스크린 리더를 위한 plain text 버전 (HTML 태그 제거)
        const bulletTextPlain = bulletText.replace(/<br\s*\/?>/gi, " ");
        // ARIA label 생성
        const ariaLabel = bulletTextPlain + "로 이동";
        
        // 접근성을 고려한 마크업 반환
        return (
          '<span class="' +
          className +
          '" role="button" aria-label="' +
          ariaLabel +
          '" tabindex="0">' +
          '<span class="bullet-wrap" aria-hidden="true">' +
          '<span class="bullet-text">' +
          bulletText +
          "</span>" +
          '<span class="bullet-num">' +
          bulletNum +
          "</span>" +
          "</span>" +
          "</span>"
        );
      },
    },
    on: {
      init: function() {
        if (this.pagination && this.pagination.el) {
          this.pagination.el.style.width = '';
        }
      },
      slideChange: function() {
        if (this.pagination && this.pagination.el) {
          this.pagination.el.style.width = '';
        }
      },
      resize: function() {
        if (this.pagination && this.pagination.el) {
          this.pagination.el.style.width = '';
        }
      }
    }
  });

  // 화면 크기 변경 시 pagination 재렌더링 (모바일/데스크탑 번호 형식 전환)
  const mediaQuery = window.matchMedia('(max-width: 767px)');
  const handleMediaChange = () => {
    if (boothSlideSwiper && boothSlideSwiper.pagination) {
      boothSlideSwiper.pagination.render();
      boothSlideSwiper.pagination.init();
      
      // aria-current 속성 재설정
      const activeBullet = document.querySelector(
        ".booth-map .slide-bx .swiper-pagination-bullet-active"
      );
      if (activeBullet) {
        activeBullet.setAttribute("aria-current", "true");
      }
    }
  };
  
  // matchMedia change 이벤트 리스너 등록
  if (mediaQuery.addEventListener) {
    mediaQuery.addEventListener('change', handleMediaChange);
  } else {
    // 구형 브라우저 지원
    mediaQuery.addListener(handleMediaChange);
  }

  // 슬라이드 변경 시 aria-current 속성 업데이트 (접근성)
  boothSlideSwiper.on("slideChange", function () {
    // 모든 bullet에서 aria-current 제거
    const allBullets = document.querySelectorAll(
      ".booth-map .slide-bx .swiper-pagination-bullet"
    );
    allBullets.forEach((bullet) => {
      bullet.removeAttribute("aria-current");
    });

    // 활성 bullet에 aria-current="true" 추가
    const activeBullet = document.querySelector(
      ".booth-map .slide-bx .swiper-pagination-bullet-active"
    );
    if (activeBullet) {
      activeBullet.setAttribute("aria-current", "true");
    }
  });

  // 초기 로드 시에도 첫 번째 bullet에 aria-current 설정
  const initialActiveBullet = document.querySelector(
    ".booth-map .slide-bx .swiper-pagination-bullet-active"
  );
  if (initialActiveBullet) {
    initialActiveBullet.setAttribute("aria-current", "true");
  }

  // 키보드 네비게이션 (화살표 키로 bullet 간 이동)
  document.addEventListener("keydown", function (e) {
    const bullets = Array.from(
      document.querySelectorAll(
        ".booth-map .slide-bx .swiper-pagination-bullet"
      )
    );
    const focusedBullet = document.activeElement;
    const currentIndex = bullets.indexOf(focusedBullet);

    // 현재 포커스가 bullet에 있을 때만 동작
    if (currentIndex === -1) return;

    let targetIndex = currentIndex;

    // 왼쪽 화살표 또는 위쪽 화살표: 이전 bullet로 이동
    if (e.key === "ArrowLeft" || e.key === "ArrowUp") {
      e.preventDefault();
      targetIndex = currentIndex > 0 ? currentIndex - 1 : bullets.length - 1;
    }
    // 오른쪽 화살표 또는 아래쪽 화살표: 다음 bullet로 이동
    else if (e.key === "ArrowRight" || e.key === "ArrowDown") {
      e.preventDefault();
      targetIndex = currentIndex < bullets.length - 1 ? currentIndex + 1 : 0;
    }
    // Home 키: 첫 번째 bullet로 이동
    else if (e.key === "Home") {
      e.preventDefault();
      targetIndex = 0;
    }
    // End 키: 마지막 bullet로 이동
    else if (e.key === "End") {
      e.preventDefault();
      targetIndex = bullets.length - 1;
    }

    // bullet에 포커스를 주고 해당 슬라이드로 이동
    if (targetIndex !== currentIndex) {
      bullets[targetIndex].focus();
      bullets[targetIndex].click();
    }
  });
}

/* Culture 슬라이드 초기화 (thumbs 방식) */
function handleCultureSlide() {
  const btnSlide = document.querySelector(".culture .btn-slide");
  const contentSlide = document.querySelector(".culture .content-slide");

  if (!btnSlide || !contentSlide) return;

  // btn-slide를 썸네일로 초기화
  const btnSwiper = new Swiper(btnSlide, {
    slidesPerView: 2.4,
    spaceBetween: 8,
    centeredSlides: true,
    watchSlidesProgress: true,
    breakpoints: {
      768: {
        slidesPerView: 5,
        spaceBetween: 17,
        centeredSlides: false,
      },
    },
  });

  // content-slide를 메인 슬라이드로 초기화하고 thumbs로 연결
  const contentSwiper = new Swiper(contentSlide, {
    slidesPerView: 1,
    spaceBetween: 0,
    effect: "fade",
    speed: 500,
    thumbs: {
      swiper: btnSwiper,
    },
  });
}

function handleTechzoneSlide(){
  const techMainSlide = document.querySelector(".techzone .slide-bx");
  const techMainSwiper = new Swiper(techMainSlide, {
    slidesPerView: 1,
    spaceBetween: 0,
    effect: "fade",
    speed: 500,
    on: {
      slideChange: function() {
        // 현재 활성화된 슬라이드 정보 가져오기
        const activeIndex = this.activeIndex;
        const activeSlide = this.slides[activeIndex];
        
        // 활성화된 슬라이드에서 실행할 효과 함수 호출
        handleActiveSlideEffect(activeSlide, activeIndex);
      }
    },
    pagination: {
      el: ".techzone .slide-bx .swiper-pagination",
      type: "bullets",
      clickable: true,
      renderBullet: function (index, className) {
        const labels = ['LG MAGNIT', 'Virtual production', 'Indoor LED', 'Outdoor LED'];
        return '<span class="' + className + '">' +
               '<span class="pagination-number">' + (index + 1) + '</span>' +
               '<span class="pagination-label">' + labels[index] + '</span>' +
               '</span>';
      },
    },
  });
  
  // 초기 로드 시 첫 번째 슬라이드 효과 실행
  if (techMainSwiper.slides && techMainSwiper.slides.length > 0) {
    handleActiveSlideEffect(techMainSwiper.slides[0], 0);
  }
};

gsap.registerPlugin(DrawSVGPlugin);


// 활성화된 슬라이드에서 실행할 효과 함수
function handleActiveSlideEffect(slideElement, slideIndex) {
  const maskedGroup = slideElement.querySelector(".masked-group");
  if (!maskedGroup) return;
  
  const maskUrl = maskedGroup.getAttribute("mask");
  if (!maskUrl) return;
  
  const maskIdMatch = maskUrl.match(/#(\w+)/);
  if (!maskIdMatch) return;
  
  const maskId = maskIdMatch[1];
  const maskElement = slideElement.querySelector(`#${maskId}`);
  if (!maskElement) return;
  
  // mask 내부 초기화
  maskElement.innerHTML = '';
  
  // 점선 path 복제 및 mask에 추가
  const paths = maskedGroup.querySelectorAll(".draw-path");
  if (!paths || paths.length === 0) return;
  
  paths.forEach((path) => {
    let clone = path.cloneNode(true);
    clone.removeAttribute("stroke-dasharray");
    clone.setAttribute("stroke", "white");
    clone.setAttribute("stroke-opacity", "1");
    gsap.set(clone, { drawSVG: "0%" });
    maskElement.appendChild(clone);
  });
  
  // 애니메이션
  gsap.to(`#${maskId} path`, {
    drawSVG: "100%",
    duration: 1.45,
    ease: "none",
    stagger: 0.1
  });
}

function handleTechzoneNewsSlide(){
  const techzoneNewsSlide = document.querySelector(".techzone-list .news-slide");
  const techzoneNewsSwiper = new Swiper(techzoneNewsSlide, {
    slidesPerView: 1,
    spaceBetween: 0,
    speed: 500,
    breakpoints: {
      768: {
        slidesPerView: 2,
        spaceBetween: 13,
      },
      1200: {
        slidesPerView: 3,
        spaceBetween: 12,
      },
    },
  });
}

/* 모든 기능 초기화 */
function init() {
  initFadeUp();
  initKVVideo();
  initBoothSlide();
  handleFooterNavClick();
  handleBoothSlide();
  handleCultureSlide();
  handleTechzoneSlide();
  handleTechzoneNewsSlide();


  new fullpage(".ise-container", {
    licenseKey: "5N617-S264H-TKC2I-1JR47-TTJWQ",
    scrollingSpeed: 1000,
    easingcss3: "cubic-bezier(0.645, 0.045, 0.355, 1.000)",
    navigation: true,
    navigationTooltips: [
      "Home",
      "Wall graphic",
      "Booth map",
      "K-Culture shop",
      "LED Tech Zone",
      "Highlight",
    ],
    showActiveTooltip: true,
    scrollOverflow: true, // 콘텐츠가 넘칠 때 섹션 내부 스크롤 활성화
    normalScrollElements: ".layer-popup, .layer-popup *, .globe, .slide-bx",
    onLeave: function(origin, destination, direction) {
      
      // direction 값을 활용할 수 있습니다
      if (direction === 'down') {
        console.log('아래로 스크롤 중');
      } else if (direction === 'up') {
        console.log('위로 스크롤 중');
      }

      const nav = document.querySelector('#fp-nav');
      
      // 다음 섹션이 3번 또는 4번이면 black 클래스 추가
      if (destination.index === 3 || destination.index === 4) {
        nav.classList.add('black');
      }
      // 현재 섹션이 3번 또는 4번이고, 다음 섹션이 아니면 black 클래스 제거
      else if (origin.index === 3 || origin.index === 4) {
        nav.classList.remove('black');
      }
    },
  });
}

// DOM 로드 후 초기화
if (document.readyState === "loading") {
  document.addEventListener("DOMContentLoaded", init);
} else {
  init();
}

// 동적으로 추가된 요소를 위해 재실행 가능하도록 함수 export (필요시)
window.reinitFadeUp = initFadeUp;