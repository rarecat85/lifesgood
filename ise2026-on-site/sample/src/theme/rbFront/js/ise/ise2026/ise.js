// ============================================================================
// CONSTANTS
// ============================================================================

// Breakpoints
const BREAKPOINT_MOBILE = 768;
const BREAKPOINT_TABLET = 769;
const BREAKPOINT_DESKTOP = 1281;

// Timing
const DEBOUNCE_DELAY_SHORT = 250;
const DEBOUNCE_DELAY_MEDIUM = 350;
const DEBOUNCE_DELAY_KV_VIDEO = 250;
const TRANSITION_DURATION = 300;
const BOOTH_SLIDE_INTERVAL = 1500;
const OBSERVER_THRESHOLD = 0.15;
const FADE_UP_DELAY_INTERVAL = 0.15;

// Scroll Indicator
const SCROLL_INDICATOR_IMAGE_WIDTH_THRESHOLD = 425;

// Class Names
const CLASS_NAMES = {
    ACTIVE: 'active',
    CLOSED: 'closed',
    HIDDEN: 'hidden',
    IS_VISIBLE: 'is-visible',
    IS_COMING_SOON: 'is-coming-soon',
    LAYER_OPEN: 'layer-open',
    HAS_ACTIVE_SUBTAB: 'has-active-subtab',
    HAS_TABLIST: 'has-tablist',
    NO_TABLIST: 'no-tablist',
    IS_HIDDEN: 'is-hidden',
};

// Selectors
const SELECTORS = {
    LAYER_POP: '.layer-pop',
    LAYER_CONTENT: '.layer-content',
    VIDEO_LAYER: '.video-layer',
    LAYER_TAB_ITEM: '.layer-tab-item',
    PHOTO_BTN: '.layer-tab .photo-btn',
    BOOTH_MAP_SWIPER: '.booth-map .slide-bx .swiper',
};


// ============================================================================
// 1. UTILITY FUNCTIONS
// ============================================================================

/**
 * 함수 실행을 지연시키는 디바운스 유틸리티
 * 
 * @param {Function} func - 실행할 함수
 * @param {number} wait - 대기 시간 (밀리초)
 * @returns {Function} 디바운스된 함수
 */
function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
        const later = () => {
            clearTimeout(timeout);
            func(...args);
        };
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
    };
}


// ============================================================================
// 3. KV VIDEO CONTROL
// ============================================================================

/**
 * KV 비디오 관련 전역 변수
 */
let kvVideo = null;
let isKVIntroComplete = false;
let kvResizeTimer = null;
let currentPlayPromise = null;
let isKVVideoInitialized = false;


/**
 * 현재 화면 크기가 모바일인지 판단
 * 
 * @returns {boolean} 모바일 여부
 */
function isMobile() {
    return window.innerWidth <= BREAKPOINT_MOBILE;
}


/**
 * 현재 화면 크기에 맞는 비디오 파일 경로를 반환
 * 
 * @param {string} type - 비디오 타입 ('intro' 또는 'default')
 * @returns {string} 비디오 파일의 전체 경로
 */
function getVideoPath(type) {
    const isMobileDevice = isMobile();
    const prefix = isMobileDevice ? "kv_" + type + "_m" : "kv_" + type;
    const devicePath = isMobileDevice ? "m" : "w";
    return `/theme/rbFront/img/${devicePath}/ise/ise2026/${prefix}.mp4`;
}


/**
 * 비디오 소스를 변경하고 재생
 * 
 * @param {string} videoPath - 새로운 비디오 파일 경로
 * @param {boolean} shouldLoop - 반복 재생 여부
 * @returns {Promise<void>}
 */
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
    kvVideo.addEventListener("canplaythrough", handleCanPlay, {
        once: true
    });
    kvVideo.addEventListener("error", handleError, {
        once: true
    });

    // intro 영상인 경우 ended 이벤트 리스너 추가
    if (!isKVIntroComplete) {
        kvVideo.addEventListener("ended", handleIntroComplete, {
            once: false
        });
    }

    // 비디오 로드 시작
    kvVideo.load();
}


/**
 * Intro 영상 재생 완료 시 default 영상으로 전환
 */
function handleIntroComplete() {
    if (isKVIntroComplete) return;

    isKVIntroComplete = true;
    const defaultVideoPath = getVideoPath("default");
    changeVideoSource(defaultVideoPath, true);
}


/**
 * 화면 크기 변경 시 영상 재설정 (모바일/데스크톱 전환 감지)
 * 디바운스 처리로 성능 최적화
 */
function handleKVResize() {
    if (!isKVVideoInitialized) return;

    clearTimeout(kvResizeTimer);
    kvResizeTimer = setTimeout(() => {
        if (!kvVideo) return;

        const wasIntroComplete = isKVIntroComplete;
        const currentVideoPath = kvVideo.src;
        const currentIsMobileVideo = currentVideoPath.includes("_m.mp4");
        const newIsMobileDevice = isMobile();

        // 모바일/데스크톱 전환이 발생한 경우에만 영상 변경
        if (currentIsMobileVideo !== newIsMobileDevice) {
            if (wasIntroComplete) {
                const defaultVideoPath = getVideoPath("default");
                changeVideoSource(defaultVideoPath, true);
            } else {
                isKVIntroComplete = false;
                const introVideoPath = getVideoPath("intro");
                changeVideoSource(introVideoPath, false);
            }
        }
    }, DEBOUNCE_DELAY_KV_VIDEO);
}


/**
 * KV 비디오 요소 초기화 및 Intro 영상 재생 시작
 */
function initKVVideo() {
  const videoBx = document.querySelector(".kv .video-bx");
  if (!videoBx) return;

  kvVideo = videoBx.querySelector("video");
  if (!kvVideo) return;

  // 초기 intro 영상 경로
  const introVideoPath = getVideoPath("intro");

  // 1. autoplay 속성은 HTML에서 제어 (모바일 자동재생 허용)
  // kvVideo.autoplay는 건드리지 않음

  // 2. 비디오 속성 설정
  kvVideo.loop = false; // intro는 반복하지 않음
  kvVideo.muted = true;
  kvVideo.playsInline = true;
  kvVideo.preload = "auto";
  kvVideo.autoplay = true;

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

      kvVideo.addEventListener("canplaythrough", handleCanPlay, {
          once: true
      });
      kvVideo.addEventListener(
          "error",
          () => {
              console.warn("Video load failed:", introVideoPath);
          }, {
              once: true
          }
      );
      kvVideo.addEventListener("ended", handleIntroComplete, {
          once: false
      });

        // 7. 새 소스 설정 (이것만으로 브라우저가 자동으로 로드 시작)
        kvVideo.src = introVideoPath;
    });
}


// ============================================================================
// 4. BOOTH SLIDE
// ============================================================================

/**
 * Booth 슬라이드 관련 전역 변수
 */
let boothSlideInterval = null;
let currentBoothIndex = 0;
let boothSlideSwiper = null;
let boothBreakpointState = null;


/**
 * Booth 이미지 자동 슬라이드 초기화
 * .booth-map .img-list의 이미지들을 자동으로 전환
 */
function initBoothSlide() {
    const boothSlides = document.querySelectorAll(".booth-map .img-list li");

    if (boothSlides.length === 0) return;

    // 자동 슬라이드 전환 함수
    function nextSlide() {
        const prevIndex = currentBoothIndex;
        currentBoothIndex = (currentBoothIndex + 1) % boothSlides.length;
        
        // 다음 슬라이드를 먼저 활성화 (z-index: 2로 위에 나타남)
        boothSlides[currentBoothIndex].classList.add(CLASS_NAMES.ACTIVE);
        
        // 이전 슬라이드 비활성화 (z-index: 1로 아래에서 사라짐)
        boothSlides[prevIndex].classList.remove(CLASS_NAMES.ACTIVE);
    }

    boothSlideInterval = setInterval(nextSlide, BOOTH_SLIDE_INTERVAL);
}


// ============================================================================
// 5. FOOTER NAVIGATION
// ============================================================================

/**
 * Footer 네비게이션 버튼 클릭 이벤트 핸들러
 * data-section 속성을 기반으로 해당 섹션으로 이동
 */
function handleFooterNavClick() {
  const footerNavLinks = document.querySelectorAll(
      ".ise-footer .nav-link[data-section]"
  );

  if (footerNavLinks.length === 0) return;

  // data-section 값을 실제 섹션 클래스로 매핑하는 테이블
  const dataSectionToClassMap = {
      "ise2026": "kv",
      "key-attractor": "led-media-art",
      "products-solutions": "booth-map",
      "k-brands-collaboration": "culture",
      "unveiled-led-technology": "techzone",
      "highlights": "highlights"
  };

  // 실제 섹션 매핑
  const sectionMap = new Map();
  const sections = document.querySelectorAll(
      ".kv, .led-media-art, .booth-map, .culture, .techzone, .highlights"
  );

  sections.forEach((section, index) => {
      const sectionClass = section.className
          .split(" ")
          .find((cls) => [
              "kv",
              "led-media-art",
              "booth-map",
              "culture",
              "techzone",
              "highlights",
          ].includes(cls));
      if (sectionClass) {
          sectionMap.set(sectionClass, {
              element: section,
              index: index + 1
          });
      }
  });

  // 각 버튼에 클릭 이벤트 리스너 추가
  footerNavLinks.forEach((button) => {
      button.addEventListener("click", () => {
          const dataSection = button.getAttribute("data-section");
          // data-section 값을 실제 섹션 클래스로 변환
          const sectionClass = dataSectionToClassMap[dataSection] || dataSection;
          const targetSection = sectionMap.get(sectionClass);

          if (targetSection) {
              // 화면 너비 기준으로 데스크톱/모바일 구분
              const isDesktop = window.innerWidth >= BREAKPOINT_DESKTOP; // 1281px
              
              if (isDesktop && typeof fullpage_api !== "undefined") {
                  // 데스크톱: fullpage.js 사용
                  fullpage_api.moveTo(targetSection.index);
              } else {
                  // 모바일/태블릿: 일반 스크롤 (페이지 끝 고려)
                  const sectionTop = targetSection.element.getBoundingClientRect().top + window.pageYOffset;
                  const maxScroll = document.documentElement.scrollHeight - window.innerHeight;
                  const scrollPosition = Math.min(sectionTop, maxScroll);
                  
                  window.scrollTo({
                      top: scrollPosition,
                      behavior: "smooth"
                  });
              }
          }
      });
    });
}


/**
 * Booth Swiper 초기화 및 반응형 처리
 * 화면 크기에 따라 다른 Swiper 설정 적용 (모바일/태블릿/데스크톱)
 */
function handleBoothSlide() {
  const boothSlide = document.querySelector(".booth-map .slide-bx .swiper");
  if (!boothSlide) return;

  // 각 슬라이드에 표시할 커스텀 텍스트 배열 (사용자가 원하는 대로 수정 가능)
  const boothSlideTexts = [
      "Hall",
      "Key<br>Attractor", 
      "LG Business Cloud <br>& Software Solutions",
      "K-Culture<br>Stores", 
      "Drive <br class='pc-only'>Thru",
      "Meeting<br>Rooms",
      "Control<br>Room",
      "E-Paper<br>Display",
      "Learning<br>Zone",
      "Hotel",
      "LED Tech<br>Zone",
  ];

  // Swiper 초기화 함수
  async function initBoothSwiper() {
      const currentWidth = window.innerWidth;
      let currentState = "mobile";

      // 현재 화면 크기에 따른 상태 결정 (1281px 분기점만 체크)
      if (currentWidth >= 1281) {
          currentState = "desktop";
      } else if (currentWidth >= 769) {
          currentState = "tablet";
      } else {
          currentState = "mobile";
      }

      // 상태가 변경되지 않았으면 재생성하지 않음
      if (boothBreakpointState === currentState && boothSlideSwiper) {
          isTransitioning = false;
          return;
      }

      // 기존 Swiper가 있으면 재생성
      if (boothSlideSwiper) {
          const currentSlideIndex = boothSlideSwiper.realIndex;

          // transition 제거하고 즉시 숨김
          const slideContainer = boothSlide.parentElement;
          slideContainer.style.transition = "none";
          slideContainer.style.opacity = "0";

          // 강제 reflow로 transition: none이 즉시 적용되도록 함
          void slideContainer.offsetHeight;

          // Swiper destroy
          boothSlideSwiper.destroy(true, true);
          boothSlideSwiper = null;

          // DOM 정리 후 새 Swiper 생성
          setTimeout(async () => {
              // Swiper 초기화 완료를 기다림
              await createSwiper(currentState, currentSlideIndex);

              // Swiper 생성 완료 후 transition 복원하고 부드럽게 표시
              requestAnimationFrame(() => {
                  slideContainer.style.transition = "opacity 0.3s ease";
                  slideContainer.style.opacity = "1";
                  isTransitioning = false;
              });
          }, 50);
      } else {
          // 초기 생성 시에는 바로 생성
          await createSwiper(currentState, 0);
          isTransitioning = false;
      }

      boothBreakpointState = currentState;
  }

  // Swiper 생성 함수 (Promise 반환)
  function createSwiper(state, initialSlide = 0) {
      return new Promise((resolve) => {
          let swiperConfig = {
              loop: true,
              speed: 500,
              initialSlide: initialSlide,
              navigation: {
                  nextEl: ".booth-map .slide-bx .next-btn",
                  prevEl: ".booth-map .slide-bx .prev-btn",
              },
              pagination: {
                  el: ".booth-map .slide-bx .swiper-pagination",
                  type: "bullets",
                  clickable: true,
                  renderBullet: function(index, className) {
                      // 번호: 첫 번째는 'H', 나머지는 모바일에서는 '1', '2', '3', 데스크탑에서는 '01', '02', '03' 형식
                      const isMobile = window.matchMedia("(max-width: 767px)").matches;
                      const bulletNum =
                          index === 0 ?
                          "H" :
                          isMobile ?
                          String(index) :
                          String(index).padStart(2, "0");
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
                          this.pagination.el.style.width = "";
                      }
                      // 초기 로드 시에도 첫 번째 bullet에 aria-current 설정
                      // requestAnimationFrame 2회 중첩으로 pagination 초기화 완료 보장
                      requestAnimationFrame(() => {
                          requestAnimationFrame(() => {
                              const initialActiveBullet = document.querySelector(
                                  ".booth-map .slide-bx .swiper-pagination-bullet-active"
                              );
                              if (initialActiveBullet) {
                                  initialActiveBullet.setAttribute("aria-current", "true");
                              }
                              // 초기화 완료 시 Promise resolve
                              resolve();
                          });
                      });

                      // pagination에 이벤트 위임 (bullet 클릭 시 menu 닫기)
                      const pagination = document.querySelector(
                          ".booth-map .swiper-pagination"
                      );
                      if (pagination && !pagination.dataset.eventAttached) {
                          pagination.addEventListener("click", function(e) {
                              if (e.target.closest(".swiper-pagination-bullet")) {
                                  const menuBtn = document.querySelector(".booth-map .menu-btn");
                                  if (menuBtn) {
                                      menuBtn.classList.remove("active");
                                  }
                                  pagination.classList.remove("active");
                              }
                          });
                          pagination.dataset.eventAttached = "true";
                      }
                  },
                  slideChange: function() {
                      if (this.pagination && this.pagination.el) {
                          this.pagination.el.style.width = "";
                      }
                      // 슬라이드 변경 시 aria-current 속성 업데이트
                      // requestAnimationFrame으로 DOM 업데이트 완료 보장
                      requestAnimationFrame(() => {
                          const allBullets = document.querySelectorAll(
                              ".booth-map .slide-bx .swiper-pagination-bullet"
                          );
                          allBullets.forEach((bullet) => {
                              bullet.removeAttribute("aria-current");
                          });

                          const activeBullet = document.querySelector(
                              ".booth-map .slide-bx .swiper-pagination-bullet-active"
                          );
                          if (activeBullet) {
                              activeBullet.setAttribute("aria-current", "true");
                          }
                      });
                  },
                  resize: function() {
                      if (this.pagination && this.pagination.el) {
                          this.pagination.el.style.width = "";
                      }
                  },
              },
          };

          // 화면 크기에 따라 다른 설정 적용
          if (state === "desktop") {
              // 1281px 이상: creative effect
              swiperConfig.slidesPerView = 1;
              swiperConfig.spaceBetween = 30;
              swiperConfig.effect = "creative";
              swiperConfig.grabCursor = true;
              swiperConfig.creativeEffect = {
                  prev: {
                      shadow: true,
                      translate: [0, 0, -400],
                  },
                  next: {
                      translate: ["100%", 0, 0],
                  },
              };
          } else if (state === "tablet") {
              // 768px~1279px: 태블릿용 설정
              swiperConfig.slidesPerView = 3;
              swiperConfig.spaceBetween = 8;
          } else {
              // 768px 미만: 모바일용 설정
              swiperConfig.slidesPerView = "auto";
              swiperConfig.spaceBetween = 10;
          }

          boothSlideSwiper = new Swiper(boothSlide, swiperConfig);
      });
    }

    // 분기점 체크 변수
    let lastCheckedState = null;
    let isTransitioning = false;

    // 리사이즈 핸들러 (디바운스 적용)
    const handleResizeDebounced = debounce(() => {
      initBoothSwiper();

      // pagination 재렌더링 (모바일/데스크탑 번호 형식 전환)
      if (boothSlideSwiper && boothSlideSwiper.pagination) {
          boothSlideSwiper.pagination.render();
          boothSlideSwiper.pagination.init();

          // aria-current 속성 재설정
          // requestAnimationFrame으로 pagination 업데이트가 DOM에 반영될 때까지 대기
          requestAnimationFrame(() => {
              const activeBullet = document.querySelector(
                  ".booth-map .slide-bx .swiper-pagination-bullet-active"
              );
              if (activeBullet) {
                    activeBullet.setAttribute("aria-current", "true");
                }
          });
        }
    }, DEBOUNCE_DELAY_MEDIUM);

    // 리사이즈 이벤트 핸들러 (즉시 페이드 아웃 + 디바운스된 재생성)
  const handleResize = () => {
      const currentWidth = window.innerWidth;
      let currentState = "mobile";

      // 현재 화면 크기에 따른 상태 결정 (1281px 분기점만 체크)
      if (currentWidth >= 1281) {
          currentState = "desktop";
      }

      // 상태가 변경되었을 때 전환 플래그 설정
      if (
          lastCheckedState !== null &&
          lastCheckedState !== currentState &&
          !isTransitioning
      ) {
          isTransitioning = true;
      }

      lastCheckedState = currentState;

      // 디바운스된 실제 재생성 함수 호출
      handleResizeDebounced();
  };

  // 초기화
  const initialWidth = window.innerWidth;
  if (initialWidth >= 1281) {
      lastCheckedState = "desktop";
  } else {
      lastCheckedState = "mobile";
  }
  initBoothSwiper();

  // 리사이즈 이벤트 리스너 등록
  window.addEventListener("resize", handleResize);

  // 화면 크기 변경 시 pagination 재렌더링 (모바일/데스크탑 번호 형식 전환)
  const mediaQuery = window.matchMedia("(max-width: 767px)");
  const handleMediaChange = () => {
      if (boothSlideSwiper && boothSlideSwiper.pagination) {
          boothSlideSwiper.pagination.render();
          boothSlideSwiper.pagination.init();

          // aria-current 속성 재설정
          // requestAnimationFrame으로 pagination 업데이트가 DOM에 반영될 때까지 대기
          requestAnimationFrame(() => {
              const activeBullet = document.querySelector(
                  ".booth-map .slide-bx .swiper-pagination-bullet-active"
              );
              if (activeBullet) {
                  activeBullet.setAttribute("aria-current", "true");
              }
          });
      }
  };

  // matchMedia change 이벤트 리스너 등록
  if (mediaQuery.addEventListener) {
      mediaQuery.addEventListener("change", handleMediaChange);
  } else {
      // 구형 브라우저 지원
      mediaQuery.addListener(handleMediaChange);
  }

  // 페이지 visibility 변경 감지 (백그라운드/절전모드 복귀 시 pagination 동기화)
  document.addEventListener("visibilitychange", () => {
      if (!document.hidden && boothSlideSwiper) {
          // 페이지가 다시 보일 때 pagination 업데이트
          // requestAnimationFrame 2회 중첩으로 pagination 렌더링 완료 보장
          requestAnimationFrame(() => {
              requestAnimationFrame(() => {
                  if (boothSlideSwiper && boothSlideSwiper.pagination) {
                      // Swiper 업데이트로 내부 상태 동기화
                      boothSlideSwiper.update();
                      
                      // pagination 강제 업데이트
                      boothSlideSwiper.pagination.render();
                      boothSlideSwiper.pagination.update();
                      
                      // aria-current 속성 재설정
                      const allBullets = document.querySelectorAll(
                          ".booth-map .slide-bx .swiper-pagination-bullet"
                      );
                      allBullets.forEach((bullet) => {
                          bullet.removeAttribute("aria-current");
                      });
                      
                      const activeBullet = document.querySelector(
                          ".booth-map .slide-bx .swiper-pagination-bullet-active"
                      );
                      if (activeBullet) {
                          activeBullet.setAttribute("aria-current", "true");
                      }
                  }
              });
          });
      }
  });

  // bfcache에서 페이지 복원 시 처리 (뒤로가기/앞으로가기)
  window.addEventListener("pageshow", (event) => {
      if (event.persisted && boothSlideSwiper) {
          // 캐시에서 복원된 경우
          // requestAnimationFrame 2회 중첩으로 pagination 렌더링 완료 보장
          requestAnimationFrame(() => {
              requestAnimationFrame(() => {
                  if (boothSlideSwiper && boothSlideSwiper.pagination) {
                      boothSlideSwiper.update();
                      boothSlideSwiper.pagination.render();
                      boothSlideSwiper.pagination.update();
                      
                      const allBullets = document.querySelectorAll(
                          ".booth-map .slide-bx .swiper-pagination-bullet"
                      );
                      allBullets.forEach((bullet) => {
                          bullet.removeAttribute("aria-current");
                      });
                      
                      const activeBullet = document.querySelector(
                          ".booth-map .slide-bx .swiper-pagination-bullet-active"
                      );
                      if (activeBullet) {
                          activeBullet.setAttribute("aria-current", "true");
                      }
                  }
              });
          });
      }
  });

  // 키보드 네비게이션 (화살표 키로 bullet 간 이동)
  document.addEventListener("keydown", function(e) {
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

  // menu-btn 클릭 이벤트 (토글)
  const menuBtn = document.querySelector(".booth-map .menu-btn");
  if (menuBtn) {
      menuBtn.addEventListener("click", () => {
          menuBtn.classList.toggle("active");
          const pagination = document.querySelector(
              ".booth-map .swiper-pagination"
          );
          if (pagination) {
              pagination.classList.toggle("active");
          }
        });
    }
}


// ============================================================================
// 6. CULTURE SLIDE
// ============================================================================

/**
 * Culture 슬라이드 초기화 (썸네일 연동 방식)
 * btn-slide를 썸네일로, content-slide를 메인으로 연결
 */
function handleCultureSlide() {
  const btnSlide = document.querySelector(".culture .btn-slide");
  const contentSlide = document.querySelector(".culture .content-slide .swiper");

  if (!btnSlide || !contentSlide) return;

  let btnSwiper = null;
  let contentSwiper = null;
  let currentIsMobile = null;
  
  // 원본 슬라이드 배열 저장
  let originalBtnSlides = null;
  let originalContentSlides = null;
  
  // 최초 실행 시 원본 저장
  if (!originalBtnSlides) {
    const btnWrapper = btnSlide.querySelector('.swiper-wrapper');
    originalBtnSlides = Array.from(btnWrapper.querySelectorAll('.swiper-slide'))
      .filter(slide => !slide.classList.contains('swiper-slide-duplicate'))
      .map(slide => slide.cloneNode(true));
  }
  
  if (!originalContentSlides) {
    const contentWrapper = contentSlide.querySelector('.swiper-wrapper');
    originalContentSlides = Array.from(contentWrapper.querySelectorAll('.swiper-slide'))
      .filter(slide => !slide.classList.contains('swiper-slide-duplicate'))
      .map(slide => slide.cloneNode(true));
  }
  
  // 슬라이드 순서 복원 함수
  function restoreOriginalOrder() {
    const btnWrapper = btnSlide.querySelector('.swiper-wrapper');
    const contentWrapper = contentSlide.querySelector('.swiper-wrapper');
    
    // btn-slide 복원
    btnWrapper.innerHTML = '';
    originalBtnSlides.forEach(slide => {
      btnWrapper.appendChild(slide.cloneNode(true));
    });
    
    // content-slide 복원
    contentWrapper.innerHTML = '';
    originalContentSlides.forEach(slide => {
      contentWrapper.appendChild(slide.cloneNode(true));
    });
  }

  // Swiper 초기화 함수
  function initSwipers() {
    const isMobile = window.innerWidth < BREAKPOINT_MOBILE;
    
    // 상태가 변경되지 않았으면 리턴
    if (currentIsMobile === isMobile) return;
    
    currentIsMobile = isMobile;
    
    // 기존 인스턴스 제거 (먼저 destroy)
    if (btnSwiper) btnSwiper.destroy(true, true);
    if (contentSwiper) contentSwiper.destroy(true, true);
    
    // destroy 후 원본 순서로 복원
    if (btnSwiper || contentSwiper) {
      restoreOriginalOrder();
    }
    
    // DOM 안정화를 위한 딜레이 후 Swiper 생성
    requestAnimationFrame(() => {
      // btn-slide를 썸네일로 초기화
      btnSwiper = new Swiper(btnSlide, {
          slidesPerView: 1,
          spaceBetween: 8,
          loopedSlides: 5,
          centeredSlides: true,
          breakpoints: {
            [BREAKPOINT_MOBILE]: {
              slidesPerView: 5,
              spaceBetween: 17,
              centeredSlides: false,
              loop:false,
              watchSlidesProgress: true,
            },
          },
      });

      // content-slide 초기화 옵션 설정
      const contentSwiperOptions = {
        slidesPerView: 1,
        spaceBetween: isMobile ? 10 : 0,
        centeredSlides: true,
        speed: 500,
        autoplay: { delay: 3000, disableOnInteraction: false, pauseOnMouseEnter: true }, 
        navigation: {
          nextEl: ".culture .content-slide .slide-next",
          prevEl: ".culture .content-slide .slide-prev",
        },
      };
  
      // 태블릿 이상: fade 효과 + thumbs로 연결
      if (!isMobile) {
        contentSwiperOptions.effect = "fade";
        contentSwiperOptions.fadeEffect = {
          crossFade: true
        };
        contentSwiperOptions.thumbs = {
          swiper: btnSwiper,
        };
      }

      contentSwiper = new Swiper(contentSlide, contentSwiperOptions);

      // 모바일: controller로 양방향 연결
      if (isMobile) {
        btnSwiper.controller.control = contentSwiper;
        contentSwiper.controller.control = btnSwiper;
      }

      // 초기화 후 리셋 (resize 시에만 실행하여 성능 최적화)
      if (currentIsMobile !== null) {
        // 브라우저 렌더링 완료 후 실행
        requestAnimationFrame(() => {
          if (btnSwiper && contentSwiper) {
            // loop 모드에서만 slideToLoop 실행
            if (btnSwiper.params.loop) {
              btnSwiper.slideToLoop(0, 0);
            }
            if (contentSwiper.params.loop) {
              contentSwiper.slideToLoop(0, 0);
            }
            
            // 상태 갱신
            btnSwiper.update();
            contentSwiper.update();
          }
        });
      }
    });
  }

  // 디바운스 적용된 resize 핸들러
  let resizeTimer;
  function handleResize() {
    clearTimeout(resizeTimer);
    resizeTimer = setTimeout(initSwipers, 200);
  }

  // 초기 실행
  initSwipers();
  
  // resize 이벤트 리스너
  window.addEventListener('resize', handleResize);
}

// ============================================================================
// 7. TECHZONE
// ============================================================================

/**
 * Techzone 메인 슬라이드 초기화
 * SVG 애니메이션과 함께 슬라이드 효과 적용
 */
function handleTechzoneSlide() {
  const techMainSlide = document.querySelector(".techzone .slide-bx");
  const techMainSwiper = new Swiper(techMainSlide, {
      slidesPerView: 1,
      spaceBetween: 0,
      effect: "fade",
      speed: 1000,
      autoplay: true,
      on: {
          slideChange: function() {
              // 현재 활성화된 슬라이드 정보 가져오기
              const activeIndex = this.activeIndex;
              const activeSlide = this.slides[activeIndex];

              // 활성화된 슬라이드에서 실행할 효과 함수 호출
              handleActiveSlideEffect(activeSlide, activeIndex);
          },
      },
      pagination: {
          el: ".techzone .slide-bx .swiper-pagination",
          type: "bullets",
          clickable: true,
          renderBullet: function(index, className) {
              const labels = [
                  "LG MAGNIT",
                  "Virtual production",
                  "Indoor LED",
                  "Mesh LED",
                  "Outdoor LED",
              ];
              return (
                  '<span class="' +
                  className +
                  '">' +
                  '<span class="pagination-number">' +
                  (index + 1) +
                  "</span>" +
                  '<span class="pagination-label">' +
                  labels[index] +
                  "</span>" +
                  "</span>"
              );
          },
      },
  });

  // 초기 로드 시 첫 번째 슬라이드 효과 실행
  if (techMainSwiper.slides && techMainSwiper.slides.length > 0) {
      handleActiveSlideEffect(techMainSwiper.slides[0], 0);
  }
}

gsap.registerPlugin(DrawSVGPlugin);


/**
 * Techzone 슬라이드의 SVG 드로잉 애니메이션 실행
 * 
 * @param {HTMLElement} slideElement - 활성화된 슬라이드 요소
 * @param {number} slideIndex - 슬라이드 인덱스
 */
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
  maskElement.innerHTML = "";

  // 점선 path 복제 및 mask에 추가
  const paths = maskedGroup.querySelectorAll(".draw-path");
  if (!paths || paths.length === 0) return;

  paths.forEach((path) => {
      let clone = path.cloneNode(true);
      clone.removeAttribute("stroke-dasharray");
      clone.setAttribute("stroke", "white");
      clone.setAttribute("stroke-opacity", "1");
      gsap.set(clone, {
          drawSVG: "0%"
      });
      maskElement.appendChild(clone);
  });

  // 애니메이션
  gsap.to(`#${maskId} path`, {
      drawSVG: "100%",
      duration: 1.45,
      ease: "none",
      stagger: 0.1,
    });
}


/**
 * Techzone 뉴스 슬라이드 초기화
 * 반응형 breakpoint에 따라 슬라이드 개수 변경
 */
function handleTechzoneNewsSlide() {
  const techzoneNewsSlide = document.querySelector(
      ".techzone-list .news-slide .swiper"
  );
  const techzoneNewsSwiper = new Swiper(techzoneNewsSlide, {
      slidesPerView: 1,
      spaceBetween: 10,
      speed: 1000,
      loop: true,
      breakpoints: {
          769: {
              slidesPerView: 2,
              spaceBetween: 13,
          },
          1281: {
              slidesPerView: 3,
              spaceBetween: 12,
          },
      },
      navigation: {
          nextEl: ".techzone-list .news-slide .slide-next",
          prevEl: ".techzone-list .news-slide .slide-prev",
      },
      pagination: {
          el: ".techzone-list .news-slide .swiper-pagination",
          type: "fraction",
      },
    });
}


// ============================================================================
// 8. HIGHLIGHTS SLIDE
// ============================================================================

/**
 * Highlights 슬라이드 관련 전역 변수
 */
let highlightsSubSwiper = null;
let highlightsBreakpointState = null;


/**
 * Highlights 슬라이드 초기화 (메인 + 서브)
 * 데스크톱에서만 서브 슬라이더 활성화, 모바일에서는 비활성화
 */
function handleHighlightsSlide() {
  const highlightsMainSlide = document.querySelector(
      ".highlights .main-slide .swiper"
  );
  const highlightsSubSlide = document.querySelector(".highlights .sub-slide");

  // Main Swiper는 항상 초기화
  const highlightsMainSwiper = new Swiper(highlightsMainSlide, {
      loop: true,
      spaceBetween: 20,
      speed: 1000,
      autoplay: true,
      navigation: {
          nextEl: ".highlights .main-slide .slide-next",
          prevEl: ".highlights .main-slide .slide-prev",
      },
      pagination: {
          el: ".highlights .main-slide .swiper-pagination",
          type: "fraction",
      },
  });

  // Sub Swiper 초기화 함수
  function initSubSwiper() {
      if (window.innerWidth > 768) {
          // 데스크톱: Sub Swiper 생성
          if (!highlightsSubSwiper) {
              highlightsSubSwiper = new Swiper(highlightsSubSlide, {
                  loop: true,
                  spaceBetween: 20,
                  speed: 1000,
                  navigation: {
                      nextEl: ".highlights .sub-slide .slide-next",
                      prevEl: ".highlights .sub-slide .slide-prev",
                  },
                  pagination: {
                      el: ".highlights .sub-slide .swiper-pagination",
                      type: "fraction",
                  },
              });
          }
          highlightsBreakpointState = "desktop";
      } else {
          // 모바일: Sub Swiper destroy
          highlightsBreakpointState = "mobile";
      }
  }

  // Resize 이벤트에서 breakpoint 변경 감지
  function handleResize() {
      const isDesktop = window.innerWidth > 768;
      const newState = isDesktop ? "desktop" : "mobile";

      // 상태가 변경되었을 때만 처리
      if (newState !== highlightsBreakpointState) {
          if (newState === "mobile" && highlightsSubSwiper) {
              // 데스크톱 → 모바일: Sub Swiper destroy
              highlightsSubSwiper.destroy(true, true);
              highlightsSubSwiper = null;
          } else if (newState === "desktop" && !highlightsSubSwiper) {
              // 모바일 → 데스크톱: Sub Swiper 재생성
              highlightsSubSwiper = new Swiper(highlightsSubSlide, {
                  loop: true,
                  spaceBetween: 20,
                  speed: 1000,
                  navigation: {
                      nextEl: ".highlights .sub-slide .slide-next",
                      prevEl: ".highlights .sub-slide .slide-prev",
                  },
                  pagination: {
                      el: ".highlights .sub-slide .swiper-pagination",
                      type: "fraction",
                  },
              });
          }
          highlightsBreakpointState = newState;
      }
  }

  // Resize 이벤트 리스너 등록
  window.addEventListener("resize", handleResize);

  // 초기화 실행
    initSubSwiper();
}


// ============================================================================
// 9. LAYER POPUP DATA
// ============================================================================

/**
 * Layer Popup 데이터 구조
 * 각 부스별 정보 (제목, 설명, 제품 목록, 미디어 갤러리 등)를 담고 있는 배열
 * 
 * @type {Array<Object>}
 */
const layerPopupData = [
  // Booth 1: Key Attractor
  {
      title: "Key Attractor",
      subtitle: "(Brand Facade)",
      description: "Experience a tower-style display powered by fine-pitch LED and T-Mesh—where media art meets premium advertising.",
      defaultBg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_1.jpg",
      productList: [{
              type: "product",
              name: "Transparent Mesh LED Signage ",
              code: "",
              link: "",
              image: "/theme/rbFront/img/w/ise/ise2026/product_img_1_1.png",
          },
          {
              type: "product",
              name: "Flat Indoor LED Signage",
              code: "LSCC012",
              link: "https://www.lg-informationdisplay.com/product/led-signage/indoor-led/LSCC012",
              image: "/theme/rbFront/img/w/ise/ise2026/product_img_1_2.png",
          },
      ],
      mediaGallery: [
          {
              type: "image",
              imageUrl: "/theme/rbFront/img/w/ise/ise2026/booth-1/booth_img_1.jpg",
          },
      ],
  },

  // Booth 2: LG Business cloud solutions
  {
      title: "LG Business Cloud & Software Solutions",
      subtitle: "",
      description: "Experience customized cloud solutions designed for every business area!",
      defaultBg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_2.jpg",
      initialScrollPosition: 50, // 0-100 사이의 퍼센티지 (50 = 중앙)
      productList: [{
              type: "solution",
              name: "LG ConnectedCare",
              description: "Remote Management Solution",
              bgClass: "type01",
              link: "https://www.lg-informationdisplay.com/software-solutions/lg-business-cloud/lg-connectedcare",
              image: "/theme/rbFront/img/w/ise/ise2026/solution_img_1.png",
          },
          {
              type: "solution",
              name: "LG SuperSign Cloud",
              description: "Content Management Solution",
              bgClass: "type02",
              link: "https://www.lg-informationdisplay.com/software-solutions/lg-business-cloud/lg-supersign-cloud",
              image: "/theme/rbFront/img/w/ise/ise2026/solution_img_2.png",
          },
          {
              type: "solution",
              name: "LG Pro:Centric Cloud",
              description: "Hotel TV Content Management Solution",
              bgClass: "type04",
              link: "https://www.lg-informationdisplay.com/software-solutions/lg-business-cloud/lg-procentric-cloud",
              image: "/theme/rbFront/img/w/ise/ise2026/solution_img_4.png",
          },
          {
              type: "solution",
              name: "LG CreateBoard Lab",
              description: "Collaborative writing solution",
              bgClass: "type05",
              link: "https://www.lg-informationdisplay.com/software-solutions/lg-business-cloud/lg-createboard-lab",
              image: "/theme/rbFront/img/w/ise/ise2026/solution_img_5.png",
          },
          {
              type: "solution",
              name: "LG ConnectedCare (DMS)",
              description: "School Display Management Solution",
              bgClass: "type06",
              link: "https://www.lg-informationdisplay.com/software-solutions/lg-business-cloud/lg-connectedcare-dms",
              image: "/theme/rbFront/img/w/ise/ise2026/solution_img_6.png",
          },
          {
              type: "product",
              name: "webOS Signage",
              code: "",
              link: "",
              image: "/theme/rbFront/img/w/ise/ise2026/product_img_2_1.png",
          },
          {
              type: "product",
              name: "Transparent OLED Signage",
              code: "30EW5TP-A",
              link: "https://www.lg-informationdisplay.com/product/oled-signage/transparent-oled/30EW5TP-A",
              image: "/theme/rbFront/img/w/ise/ise2026/product_img_2_2.png",
          },
      ],
      mediaGallery: [
          {
              type: "image",
              imageUrl: "/theme/rbFront/img/w/ise/ise2026/booth-2/booth_img_1.jpg",
          },
      ],
  },

  // Booth 3: K-Culture shop
  {
      title: "K-Culture Stores",
      subtitle: "",
      description: "Experience a tower-style display powered by fine-pitch LED and T-Mesh—where media art meets premium advertising.",
      defaultBg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_3.jpg",
      initialScrollPosition: 52, // 0-100 사이의 퍼센티지 (50 = 중앙)
      tablist: [{
              name: "LG Connected Care",
              subname: "LG Connected Care",
              id: "tab-3-1",
              bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_3_tab_1.jpg",
              title: "Display Remote Management Solution",
              description: "LG ConnectedCare is a cloud-based solution that remotely monitors and manages LG signage to ensure optimal performance anytime, anywhere.",
              productList: [{
                      type: "solution",
                      name: "LG ConnectedCare",
                      description: "Remote Management Solution",
                      bgClass: "type01",
                      link: "https://www.lg-informationdisplay.com/software-solutions/lg-business-cloud/lg-connectedcare",
                      image: "/theme/rbFront/img/w/ise/ise2026/solution_img_1.png",
                  },
                  {
                      type: "product",
                      name: "4K UHD Signage",
                      code: "65UH5Q",
                      link: "https://www.lg-informationdisplay.com/product/digital-signage/standard/65UH5Q",
                      image: "/theme/rbFront/img/w/ise/ise2026/product_img_3_1_1.png",
                  },
                  {
                      type: "product",
                      name: "Transparent OLED Signage",
                      code: "55EW5P-M",
                      link: "https://www.lg-informationdisplay.com/product/oled-signage/transparent-oled/55EW5P-M",
                      image: "/theme/rbFront/img/w/ise/ise2026/product_img_3_1_2.png",
                  },
              ],
          },
          {
              name: "LG SuperSign Cloud",
              subname: "LG SuperSign Cloud",
              id: "tab-3-2",
              bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_3_tab_2.jpg",
              title: "Amplify Ambience with Cloud-Based Content Management Solution",
              description: "LG SuperSign Cloud is a cloud-based CMS that simplifies remote control and content delivery for digital signage—anytime, anywhere.",
              productList: [{
                      type: "solution",
                      name: "LG SuperSign Cloud",
                      description: "Content Management Solution",
                      bgClass: "type02",
                      link: "https://www.lg-informationdisplay.com/software-solutions/lg-business-cloud/lg-supersign-cloud",
                      image: "/theme/rbFront/img/w/ise/ise2026/solution_img_2.png",
                  },
                  {
                      type: "product",
                      name: "Stretch Signage",
                      code: "37BH7N",
                      link: "https://www.lg-informationdisplay.com/product/digital-signage/special/37BH7N",
                      image: "/theme/rbFront/img/w/ise/ise2026/product_img_3_2_1.png",
                  },
                  {
                      type: "product",
                      name: "4K UHD Signage",
                      code: "65UH5Q",
                      link: "https://www.lg-informationdisplay.com/product/digital-signage/standard/65UH5Q",
                      image: "/theme/rbFront/img/w/ise/ise2026/product_img_3_2_2.png",
                  },
                  {
                      type: "product",
                      name: "Transparent OLED Signage",
                      code: "55EW5P-M",
                      link: "https://www.lg-informationdisplay.com/product/oled-signage/transparent-oled/55EW5P-M",
                      image: "/theme/rbFront/img/w/ise/ise2026/product_img_3_2_3.png",
                  },
              ],
          },
          {
              name: "LG DOOH Ads",
              subname: "LG DOOH Ads",
              id: "tab-3-3",
              bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_3_tab_3.jpg",
              title: "Signage Display Advertising Platform",
              description: "LG DOOH Ads helps screen owners turn everyday displays into new revenue opportunities.",
              productList: [{
                      type: "solution",
                      name: "LG DOOH Ads",
                      description: "Smart advertising solution",
                      bgClass: "type03",
                      link: "https://www.lg-informationdisplay.com/software-solutions/lg-business-cloud/lg-dooh-ads",
                      image: "/theme/rbFront/img/w/ise/ise2026/solution_img_3.png",
                  },
                  {
                      type: "product",
                      name: "Stretch Signage",
                      code: "37BH7N",
                      link: "https://www.lg-informationdisplay.com/product/digital-signage/special/37BH7N",
                      image: "/theme/rbFront/img/w/ise/ise2026/product_img_3_3_1.png",
                  },
                  {
                      type: "product",
                      name: "4K UHD Signage",
                      code: "65UH5Q",
                      link: "https://www.lg-informationdisplay.com/product/digital-signage/standard/65UH5Q",
                      image: "/theme/rbFront/img/w/ise/ise2026/product_img_3_3_2.png",
                  },
                  {
                      type: "product",
                      name: "LG Kiosk",
                      code: "27KC3P-M",
                      link: "https://www.lg-informationdisplay.com/product/digital-signage/special/27KC3P-M",
                      image: "/theme/rbFront/img/w/ise/ise2026/product_img_3_3_3.png",
                  },
              ],
          },
          {
              name: "LG SoundCast",
              subname: "LG SoundCast",
              id: "tab-3-4",
              bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_3_tab_4.jpg",
              title: "Synchronized content control for retail displays",
              description: "We wanted consistent control of global in-store screens so customers enjoy Palm Pals as we imagined.",
              productList: [{
                      type: "solution",
                      name: "LG SoundCast",
                      description: "",
                      bgClass: "type07",
                      link: "",
                      image: "/theme/rbFront/img/w/ise/ise2026/solution_img_7.png",
                  },
                  {
                      type: "product",
                      name: "4K UHD Signage",
                      code: "65UH5Q",
                      link: "https://www.lg-informationdisplay.com/product/digital-signage/standard/65UH5Q",
                      image: "/theme/rbFront/img/w/ise/ise2026/product_img_3_4_1.png",
                  },
                  {
                      type: "product",
                      name: "Stretch Signage",
                      code: "37BH7N",
                      link: "https://www.lg-informationdisplay.com/product/digital-signage/special/37BH7N",
                      image: "/theme/rbFront/img/w/ise/ise2026/product_img_3_4_2.png",
                  },
                  {
                      type: "product",
                      name: "13.3” E-Paper Display",
                      code: '',
                      link: "",
                      image: "/theme/rbFront/img/w/ise/ise2026/product_img_3_4_3.png",
                  },
              ],
          },
          {
              name: "LG All-In-One LED",
              subname: "LG All-In-One LED",
              id: "tab-3-5",
              bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_3_tab_5.jpg",
              title: "An all-in-one LED display with webOS and built-in speakers.",
              description: "The LG LED All-in-One LAPA series delivers a stunning 163- or 136-inch display with built-in control and sound—designed for fast, hassle-free installation.",
              productList: [{
                  type: "product",
                  name: "All-in-One LED",
                  code: "LAPA136",
                  link: "https://www.lg-informationdisplay.com/product/led-signage/indoor-led/lg-led-all-in-one/LAPA136",
                  image: "/theme/rbFront/img/w/ise/ise2026/product_img_3_5_1.png",
              }, ],
          },
      ],
      mediaGallery: [
          {
              type: "image",
              imageUrl: "/theme/rbFront/img/w/ise/ise2026/booth-3/booth_img_1.jpg",
          },
      ],
  },

  // Booth 4: Drive-thru
  {
      title: "Drive Thru",
      subtitle: "",
      description: "Experience a tower-style display powered by fine-pitch LED and T-Mesh—where media art meets premium advertising.",
      defaultBg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_4.jpg",
      initialScrollPosition: 0, // 0-100 사이의 퍼센티지 (50 = 중앙)
      productList: [{
              type: "product",
              name: "Outdoor LED Signage",
              code: "GSPC029",
              link: "https://www.lg-informationdisplay.com/product/led-signage/outdoor-led/GSPC029",
              image: "/theme/rbFront/img/w/ise/ise2026/product_img_4_1.png",
          },
          {
              type: "product",
              name: "Open-frame Signage",
              code: "55XF3P",
              link: "https://www.lg-informationdisplay.com/product/digital-signage/high-brightness/open-frame/55XF3P",
              image: "/theme/rbFront/img/w/ise/ise2026/product_img_4_2.png",
          },
          {
              type: "product",
              name: "Outdoor Signage",
              code: "49XE4F",
              link: "https://www.lg-informationdisplay.com/product/digital-signage/high-brightness/ip-rated-outdoor/49XE4F-M",
              image: "/theme/rbFront/img/w/ise/ise2026/product_img_4_3.png",
          },
          {
              type: "product",
              name: "Outdoor Signage",
              code: "55XE4P-B",
              link: "https://www.lg-informationdisplay.com/product/digital-signage/high-brightness/ip-rated-outdoor/55XE4P-B",
              image: "/theme/rbFront/img/w/ise/ise2026/product_img_4_4.png",
          },
          {
              type: "product",
              name: "Outdoor Signage",
              code: "22XE1J-B",
              link: "https://www.lg-informationdisplay.com/product/digital-signage/high-brightness/ip-rated-outdoor/22XE1J-B",
              image: "/theme/rbFront/img/w/ise/ise2026/product_img_4_5.png",
          },
          {
              type: "product",
              name: "4K UHD Signage",
              code: "55UL5Q-E",
              link: "https://www.lg-informationdisplay.com/product/digital-signage/standard/55UL5Q-E",
              image: "/theme/rbFront/img/w/ise/ise2026/product_img_4_6.png",
          },
      ],
      mediaGallery: [
          {
              type: "image",
              imageUrl: "/theme/rbFront/img/w/ise/ise2026/booth-4/booth_img_1.jpg",
          },
      ],
  },

  // Booth 5: Meeting room
  {
      title: "Meeting Rooms",
      subtitle: "",
      description: "Experience a tower-style display powered by fine-pitch LED and T-Mesh—where media art meets premium advertising.",
      defaultBg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_5.jpg",
      initialScrollPosition: 31.8, // 0-100 사이의 퍼센티지 (50 = 중앙)
      tablist: [{
        name: "Huddle rooms",
        subname: "Huddle rooms",
        id: "tab-5-1",
        bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_5_tab_1.jpg",
        title: "Spark ideas, inspire collaboration ",
        description: "Smart displays help teams share ideas, collaborate easily, and stay focused during meetings.",
        productList: [{
                type: "product",
                name: "LG CreateBoard",
                code: "65TR3BQ",
                link: "https://www.lg-informationdisplay.com/product/digital-signage/interactive/65TR3BQ",
                image: "/theme/rbFront/img/w/ise/ise2026/product_img_5_1_1.png",
            },
        ],
      },
      {
        name: "Board rooms",
        subname: "Board rooms",
        id: "tab-5-2",
        bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_5_tab_2.jpg",
        title: "Excellence with all-in-one micro LED display.",
        description: "Executive-ready visuals and built-in control deliver confident presentations with effortless setup.",
        productList: [{
                type: "product",
                name: "LG MAGNIT AIO",
                code: "",
                link: "",
                image: "/theme/rbFront/img/w/ise/ise2026/product_img_5_2_1.png",
            },
        ],
      },
      {
        name: "Meeting rooms",
        subname: "Meeting rooms",
        id: "tab-5-3",
        bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_5_tab_3.jpg",
        title: "Smart collaboration that empowers teamwork.",
        description: "Interactive displays and intuitive sharing tools help teams collaborate and work more efficiently.",
        tabImgScroll: true,
        initialScrollPosition: 0,
        productList: [{
                type: "product",
                name: "4K UHD Signage",
                code: "65UH5Q",
                link: "https://www.lg-informationdisplay.com/product/digital-signage/standard/65UH5Q",
                image: "/theme/rbFront/img/w/ise/ise2026/product_img_5_3_1.png",
            },
            {
              type: "product",
              name: "LG CreateBoard",
              code: "105TR5WP",
              link: "https://www.lg-informationdisplay.com/product/digital-signage/interactive/105TR5WP",
              image: "/theme/rbFront/img/w/ise/ise2026/product_img_5_3_2.png",
            },
              {
                type: "product",
                name: "4K UHD Signage",
                code: "55UH5Q",
                link: "https://www.lg-informationdisplay.com/product/digital-signage/standard/55UH5Q",
                image: "/theme/rbFront/img/w/ise/ise2026/product_img_5_3_3.png",
            },
            {
              type: "product",
              name: "4K UHD Signage",
              code: "55UL5Q-E",
              link: "https://www.lg-informationdisplay.com/product/digital-signage/standard/55UL5Q-E",
              image: "/theme/rbFront/img/w/ise/ise2026/product_img_5_3_4.png",
            },
          ],
        },
      ],
      mediaGallery: [
          {
              type: "image",
              imageUrl: "/theme/rbFront/img/w/ise/ise2026/booth-5/booth_img_1.jpg",
          },
      ],
  },

  // Booth 6: Control room
  {
      title: "Control Room",
      subtitle: "",
      description: "Experience a tower-style display powered by fine-pitch LED and T-Mesh—where media art meets premium advertising.",
      defaultBg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_6.jpg",
      initialScrollPosition: 37, // 0-100 사이의 퍼센티지 (50 = 중앙)
      productList: [{
              type: "solution",
              name: "LG ConnectedCare",
              description: "Remote Management Solution",
              bgClass: "type01",
              link: "https://www.lg-informationdisplay.com/software-solutions/lg-business-cloud/lg-connectedcare",
              image: "/theme/rbFront/img/w/ise/ise2026/solution_img_1.png",
          },
          {
              type: "solution",
              name: "LG Shield",
              description: "",
              bgClass: "type08",
              link: "https://lgshield.lge.com/en",
              image: "/theme/rbFront/img/w/ise/ise2026/solution_img_8.png",
          },
          {
              type: "product",
              name: "Commercial Micro LED",
              code: "LSAB009",
              link: "https://www.lg-informationdisplay.com/product/led-signage/indoor-led/lg-magnit/LSAB009",
              image: "/theme/rbFront/img/w/ise/ise2026/product_img_6_1.png",
          },
      ],
      mediaGallery: [
          {
              type: "image",
              imageUrl: "/theme/rbFront/img/w/ise/ise2026/booth-6/booth_img_1.jpg",
          },
      ],
  },

  // Booth 7: E-Paper display
  {
      title: "E-Paper Display",
      subtitle: "",
      description: "Experience a tower-style display powered by fine-pitch LED and T-Mesh—where media art meets premium advertising.",
      disableScroll: true,
      defaultBg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_7.jpg",
      productList: [{
              type: "product",
              name: "32” E-Paper Display",
              code: "",
              link: "",
              image: "/theme/rbFront/img/w/ise/ise2026/product_img_7_1.png",
          },
          {
              type: "product",
              name: "13.3” E-Paper Display",
              code: "",
              link: "",
              image: "/theme/rbFront/img/w/ise/ise2026/product_img_7_2.png",
          },
      ],
      mediaGallery: [
          {
              type: "image",
              imageUrl: "/theme/rbFront/img/w/ise/ise2026/booth-7/booth_img_1.jpg",
          },
      ],
  },

  // Booth 8: Learning zone
  {
      title: "Learning Zone",
      subtitle: "",
      description: "Experience a tower-style display powered by fine-pitch LED and T-Mesh—where media art meets premium advertising.",
      defaultBg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_8.jpg",
      initialScrollPosition: 0, // 0-100 사이의 퍼센티지 (50 = 중앙)
      productList: [{
              type: "product",
              name: "LG CreateBoard",
              code: "",
              link: "",
              image: "/theme/rbFront/img/w/ise/ise2026/product_img_8_1.png",
          },
          {
              type: "product",
              name: "4K UHD Signage",
              code: "65UH5Q",
              link: "https://www.lg-informationdisplay.com/product/digital-signage/standard/65UH5Q",
              image: "/theme/rbFront/img/w/ise/ise2026/product_img_8_2.png",
          },
          {
              type: "product",
              name: "LG CreateBoard Standard",
              code: "75TR3DQ",
              link: "https://www.lg-informationdisplay.com/product/digital-signage/interactive/75TR3DQ",
              image: "/theme/rbFront/img/w/ise/ise2026/product_img_8_3.png",
          },
          {
              type: "product",
              name: "LG CreateBoard Core",
              code: "65TR3BQ",
              link: "https://www.lg-informationdisplay.com/product/digital-signage/interactive/65TR3BQ",
              image: "/theme/rbFront/img/w/ise/ise2026/product_img_8_4.png",
          },
      ],
      mediaGallery: [
          {
              type: "image",
              imageUrl: "/theme/rbFront/img/w/ise/ise2026/booth-8/booth_img_1.jpg",
          },
      ],
  },

  // Booth 9: Hotel zone
  {
      title: "Hotel",
      subtitle: "",
      description: "Experience a tower-style display powered by fine-pitch LED and T-Mesh—where media art meets premium advertising.",
      defaultBg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_9.jpg",
      initialScrollPosition: 0, // 0-100 사이의 퍼센티지 (50 = 중앙)
      productList: [{
              type: "solution",
              name: "LG Pro:Centric Cloud",
              description: "Hotel TV Content Management Solution",
              bgClass: "type04",
              link: "https://www.lg-informationdisplay.com/software-solutions/lg-business-cloud/lg-procentric-cloud",
              image: "/theme/rbFront/img/w/ise/ise2026/solution_img_4.png",
          },
          {
              type: "product",
              name: "4K UHD TV with Pro:Centric",
              code: "65UK767H",
              link: "https://www.lg-informationdisplay.com/product/commercial-tv/hotel-tv/65UK767H-EU-CIS",
              image: "/theme/rbFront/img/w/ise/ise2026/product_img_9_1.png",
          },
          {
              type: "product",
              name: "4K UHD TV with Pro:Centric",
              code: "65UK762H",
              link: "https://www.lg-informationdisplay.com/product/commercial-tv/hotel-tv/65UK762H-EU-CIS",
              image: "/theme/rbFront/img/w/ise/ise2026/product_img_9_2.png",
          },
          {
              type: "product",
              name: "4K UHD TV with Pro:Centric",
              code: "55UK660H",
              link: "https://www.lg-informationdisplay.com/product/commercial-tv/hotel-tv/55UK660H-EU-CIS",
              image: "/theme/rbFront/img/w/ise/ise2026/product_img_9_3.png",
          },
      ],
      mediaGallery: [
          {
              type: "image",
              imageUrl: "/theme/rbFront/img/w/ise/ise2026/booth-9/booth_img_1.jpg",
          },
      ],
  },

  // Booth 10: LED tech zone
  {
      title: "LED Tech Zone",
      subtitle: "",
      description: "Experience a tower-style display powered by fine-pitch LED and T-Mesh—where media art meets premium advertising.",
      defaultBg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_10.jpg",
      initialScrollPosition: 0, // 0-100 사이의 퍼센티지 (50 = 중앙)
      tablist: [{
              name: "LG MAGNIT 1",
              subname: "LG MAGNIT (Live Demo)",
              id: "tab-10-1",
              bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_10_tab_1.jpg",
              title: "LG MAGNIT (Live Demo)",
              description: "<span class='dot-txt'>More clarity, accuracy, and vibrancy. <br>Less work, lower TCO, and reduced fire risk.</span> <br> <span class='dot-txt'>Flicker-free clarity, smart pixel recovery, and seamless front-leveling innovation.</span>",
              productList: [{
                          type: "product",
                          name: "Commerical Micro LED",
                          code: "LMPB007",
                          link: "https://www.lg-informationdisplay.com/product/led-signage/indoor-led/lg-magnit/LMPB007",
                          image: "/theme/rbFront/img/w/ise/ise2026/product_img_10_1_1.png",
                      },
                      {
                        type: "product",
                        name: "Commercial Micro LED",
                        code: "LMPB009",
                        link: "https://www.lg-informationdisplay.com/product/led-signage/indoor-led/lg-magnit-active-micro-led/LMPB009",
                        image: "/theme/rbFront/img/w/ise/ise2026/product_img_10_1_2.png",
                      },
                      {
                        type: "product",
                        name: "Commercial Micro LED",
                        code: "LMPA009",
                        link: "https://www.lg-informationdisplay.com/product/led-signage/indoor-led/lg-magnit/LMPA009",
                        image: "/theme/rbFront/img/w/ise/ise2026/product_img_10_1_3.png",
                      },
                      {
                        type: "product",
                        name: "Indoor LED",
                        code: "LMEA012",
                        link: "https://www.lg-informationdisplay.com/product/led-signage/indoor-led/LMEA012",
                        image: "/theme/rbFront/img/w/ise/ise2026/product_img_10_1_4.png",
                      }
              ],
          },
          {
              name: "LG MAGNIT 2",
              subname: "LG MAGNIT",
              id: "tab-10-2",
              bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_10_tab_2.jpg",
              title: "LG MAGNIT",
              description: "The Pinnacle of LG’s Self-Emitting Next Generation Micro LED.",
              productList: [{
                      type: "product",
                      name: "LG MAGNIT Active Micro LED",
                      code: "LSAH007",
                      link: "https://www.lg-informationdisplay.com/product/led-signage/indoor-led/lg-magnit-active-micro-led/LSAH007",
                      image: "/theme/rbFront/img/w/ise/ise2026/product_img_10_2_1.png",
                  },
              ],
          },
          {
              name: "Virtual production",
              subname: "Virtual production",
              id: "tab-10-3",
              bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_10_tab_3.jpg",
              title: "Virtual production",
              description: "Built for virtual production and XR environments with precise visuals and reliable performance.",
              productList: [{
                      type: "product",
                      name: "Virtual Production LED",
                      code: "",
                      link: "",
                      image: "/theme/rbFront/img/w/ise/ise2026/product_img_10_3_1.png",
                  },
                  {
                      type: "product",
                      name: "Virtual Production LED",
                      code: "LBPA019",
                      link: "https://www.lg-informationdisplay.com/product/led-signage/indoor-led/virtual-production/LBPA019",
                      image: "/theme/rbFront/img/w/ise/ise2026/product_img_10_3_2.png",
                  },
                  {
                      type: "product",
                      name: "Virtual Production LED",
                      code: "LFCL039",
                      link: "https://www.lg-informationdisplay.com/product/led-signage/indoor-led/virtual-production/LFCL039",
                      image: "/theme/rbFront/img/w/ise/ise2026/product_img_10_3_3.png",
                  },
                  {
                      type: "product",
                      name: "Virtual Production Micro LED",
                      code: "LBAF015",
                      link: "https://www.lg-informationdisplay.com/product/led-signage/indoor-led/lg-magnit/LBAF015",
                      image: "/theme/rbFront/img/w/ise/ise2026/product_img_10_3_4.png",
                  },
              ],
          },
          {
              name: "Indoor LED",
              subname: "Indoor LED",
              id: "tab-10-4",
              bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_10_tab_4.jpg",
              title: "Indoor LED",
              description: "Micro LED, now within reach with flexible cabinet options.",
              productList: [{
                      type: "product",
                      name: "Indoor LED",
                      code: "LMEA012",
                      link: "https://www.lg-informationdisplay.com/product/led-signage/indoor-led/LMEA012",
                      image: "/theme/rbFront/img/w/ise/ise2026/product_img_10_4_1.png",
                  },
                  {
                      type: "product",
                      name: "Indoor LED",
                      code: "LSCC012",
                      link: "https://www.lg-informationdisplay.com/product/led-signage/indoor-led/LSCC012",
                      image: "/theme/rbFront/img/w/ise/ise2026/product_img_10_4_2.png",
                  },
                  {
                      type: "product",
                      name: "Indoor LED",
                      code: "LSCC015",
                      link: "https://www.lg-informationdisplay.com/product/led-signage/indoor-led/LSCC015",
                      image: "/theme/rbFront/img/w/ise/ise2026/product_img_10_4_3.png",
                  },
                  {
                      type: "product",
                      name: "Indoor LED",
                      code: "LSCC018",
                      link: "https://www.lg-informationdisplay.com/product/led-signage/indoor-led/LSCC018",
                      image: "/theme/rbFront/img/w/ise/ise2026/product_img_10_4_4.png",
                  },
                  {
                      type: "product",
                      name: "Indoor LED",
                      code: "LSCC025",
                      link: "https://www.lg-informationdisplay.com/product/led-signage/indoor-led/LSCC025",
                      image: "/theme/rbFront/img/w/ise/ise2026/product_img_10_4_5.png",
                  },
              ],
          },
          {
              name: "Mesh LED",
              subname: "Mesh LED",
              id: "tab-10-5",
              bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_10_tab_5.jpg",
              title: "Mesh LED",
              description: "Maximized space with transparent tech.",
              productList: [{
                      type: "product",
                      name: "Mesh LED",
                      code: "GMBD035",
                      link: "https://www.lg-informationdisplay.com/product/led-signage/outdoor-led/mesh-led/GMBD035",
                      image: "/theme/rbFront/img/w/ise/ise2026/product_img_10_5_1.png",
                  },
                  {
                    type: "product",
                    name: "Outdoor LED",
                    code: "",
                    link: "",
                    image: "/theme/rbFront/img/w/ise/ise2026/product_img_10_5_2.png",
                  },
              ],
          },
          {
              name: "Outdoor LED",
              subname: "Outdoor LED",
              id: "tab-10-6",
              bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_10_tab_6.jpg",
              title: "Outdoor LED",
              description: "Maximize space with transparent tech and deliver bright and clear impact in outdoor stadiums.",
              productList: [{
                      type: "product",
                      name: "Stadium LED",
                      code: "GRPA062",
                      link: "https://www.lg-informationdisplay.com/product/led-signage/outdoor-led/stadium-led/GRPA062",
                      image: "/theme/rbFront/img/w/ise/ise2026/product_img_10_6_1.png",
                  },
                  {
                      type: "product",
                      name: "Outdoor LED",
                      code: "GPPA062",
                      link: "https://www.lg-informationdisplay.com/product/led-signage/outdoor-led/stadium-led/GPPA062",
                      image: "/theme/rbFront/img/w/ise/ise2026/product_img_10_6_2.png",
                  },
                  {
                      type: "product",
                      name: "Outdoor LED",
                      code: "GSPB039",
                      link: "https://www.lg-informationdisplay.com/product/led-signage/outdoor-led/GSPB039",
                      image: "/theme/rbFront/img/w/ise/ise2026/product_img_10_6_3.png",
                  },
              ],
          }
      ],
      mediaGallery: [
          {
              type: "image",
              imageUrl: "/theme/rbFront/img/w/ise/ise2026/booth-10/booth_img_1.jpg",
          },
      ],
    },
];

// ============================================================================
// 10. LAYER POPUP MANAGEMENT
// ============================================================================

/**
 * 준비중인 제품 클릭 시 알림 표시
 * 
 * @param {Event} event - 클릭 이벤트
 */
function handleComingSoonProduct(event) {
  const alertLayer = document.querySelector('.alert-layer');
  alertLayer.classList.add('active');
  const closeBtn = alertLayer.querySelector('.close-btn');
  closeBtn.addEventListener('click', () => {
    alertLayer.classList.remove('active');
  });
}


/**
 * Product-item HTML 생성 헬퍼 함수
 * 
 * @param {Object} product - 제품 객체
 * @param {Array} productList - 전체 제품 목록
 * @returns {string} 생성된 HTML 문자열
 */
function generateProductItemHTML(product, productList) {
  const isSolution = product.type === "solution";
  const isProduct = product.type === "product";
  const productItems = productList.filter((p) => p.type === "product");
  const productIndex = productItems.indexOf(product);
  const label =
      isProduct && productIndex >= 0 ?
      String.fromCharCode(97 + productIndex) :
      "";
  const bgClass = isSolution && product.bgClass ? product.bgClass : "";

  return `
  <a href="${product.link || "#"}" class="product-item ${bgClass} ${
  !product.link ? "is-coming-soon" : ""
}" ${
  product.link
    ? 'target="_blank" rel="noopener noreferrer"'
    : 'data-coming-soon="true"'
}>
    ${
      product.image
        ? `
      <div class="product-img-wrapper">
        <img src="${product.image}" alt="${
            product.name
          }" class="product-img" loading="lazy">
        ${
          isProduct && label
            ? `<span class="product-label">${label}</span>`
            : ""
        }
      </div>
    `
        : ""
    }
    <div class="product-info">
      ${
        isSolution
          ? `
        <span class="product-name">${product.name}</span>
        ${
          !product.link
            ? `<span class="product-description">Coming Soon</span>`
            : product.description
              ? `<span class="product-description">${product.description}</span>`
              : ""
        }
      `
          : `
        <span class="product-name">${product.name}</span>
        ${
          !product.link
            ? `<span class="product-code">Coming Soon</span>`
            : product.code
              ? `<span class="product-code">${product.code}</span>`
              : ""
        }
      `
      }
    </div>
  </a>
`;
}


/**
 * 스크롤 인디케이터 표시/숨김 체크
 * 이미지 너비가 임계값보다 크면 인디케이터 표시
 * @param {number} index - 부스 인덱스 (0-9)
 * @returns {Promise} 스크롤 설정 완료 후 resolve
 */
function checkScrollIndicator(index) {
    return new Promise((resolve) => {
        const boothDetailImage = document.querySelector('.booth-detail-img');
        const boothDetailImageWrap = document.querySelector('.booth-detail-img-wrap'); // 실제 스크롤 요소
        const image = document.querySelector('.booth-detail-img img');
        const scrollIndicator = document.querySelector('.scroll-indicator');

        // no-scroll 클래스가 있으면 스크롤 인디케이터 처리 생략
        if (boothDetailImageWrap && boothDetailImageWrap.classList.contains('no-scroll')) {
            resolve();
            return;
        }

        if (!boothDetailImage || !boothDetailImageWrap || !image || !scrollIndicator) {
            resolve();
            return;
        }

        // 이미지 로드 완료 후 크기 체크
        if (image.complete) {
            checkAndShowIndicator();
        } else {
            image.addEventListener('load', checkAndShowIndicator);
        }

        function checkAndShowIndicator() {
            const imageWidth = image.naturalWidth || image.width;

            if (imageWidth > SCROLL_INDICATOR_IMAGE_WIDTH_THRESHOLD) {
                scrollIndicator.style.display = 'block';
                
                // 이미지 로드 후 레이아웃 계산 완료를 보장
                requestAnimationFrame(() => {
                    requestAnimationFrame(() => {
                        // layerPopupData에서 initialScrollPosition 값을 가져옴 (없으면 기본값 50%)
                        const data = layerPopupData[index];
                        const initialScrollPosition = data && data.initialScrollPosition !== undefined 
                            ? data.initialScrollPosition 
                            : 50;
                        
                        // 퍼센티지를 0-1 사이의 비율로 변환
                        const scrollPercentage = initialScrollPosition / 100;
                        
                        // 실제 스크롤 가능한 요소(.booth-detail-img-wrap)의 스크롤 위치를 설정
                        const scrollableWidth = boothDetailImageWrap.scrollWidth - boothDetailImageWrap.clientWidth;
                        if (scrollableWidth > 0) {
                            boothDetailImageWrap.scrollLeft = scrollableWidth * scrollPercentage;
                        }
                        
                        // scroll 이벤트가 완전히 처리될 때까지 대기 후 resolve
                        setTimeout(() => {
                            resolve();
                        }, 50); // 충분한 시간 확보
                    });
                });
            } else {
                scrollIndicator.style.display = 'none';
                resolve();
            }
        }
    });
}


/**
 * 스크롤 인디케이터 터치/클릭 시 숨김 처리
 * 사용자 인터랙션 감지 시 인디케이터를 페이드 아웃
 */
function initScrollIndicatorHide() {
    const boothDetailImage = document.querySelector('.booth-detail-img');
    const boothDetailImageWrap = document.querySelector('.booth-detail-img-wrap'); // 실제 스크롤 요소
    const scrollIndicator = document.querySelector('.scroll-indicator');

    if (!boothDetailImage || !boothDetailImageWrap || !scrollIndicator) return;

    const hideIndicator = () => {
        scrollIndicator.classList.add(CLASS_NAMES.ACTIVE);
    };

    // booth-detail-img 영역 터치/클릭 시 인디케이터 숨김
    boothDetailImage.addEventListener('touchstart', hideIndicator, { once: true });
    boothDetailImage.addEventListener('click', hideIndicator, { once: true });
    // 실제 스크롤이 일어나는 요소(.booth-detail-img-wrap)에 스크롤 이벤트 등록
    boothDetailImageWrap.addEventListener('scroll', hideIndicator, { once: true });
}


/**
 * 탭 디테일 이미지 스크롤 인디케이터 표시/숨김 체크
 * 이미지 너비가 임계값보다 크면 인디케이터 표시
 * @returns {Promise} 스크롤 설정 완료 후 resolve
 */
function checkTabDetailScrollIndicator() {
    return new Promise((resolve) => {
        const tabDetailImgs = document.querySelectorAll('.tab-detail-img');
        
        if (tabDetailImgs.length === 0) {
            resolve();
            return;
        }

        let checkCount = 0;
        const totalCount = tabDetailImgs.length;

        tabDetailImgs.forEach((tabDetailImg) => {
            const tabDetailImageWrap = tabDetailImg.querySelector('.tab-detail-img-wrap');
            const image = tabDetailImg.querySelector('img');
            const scrollIndicator = tabDetailImg.querySelector('.scroll-indicator');

            if (!tabDetailImageWrap || !image || !scrollIndicator) {
                checkCount++;
                if (checkCount === totalCount) resolve();
                return;
            }

            // 이미지 로드 완료 후 크기 체크
            if (image.complete) {
                checkAndShowIndicator();
            } else {
                image.addEventListener('load', checkAndShowIndicator);
            }

            function checkAndShowIndicator() {
                const imageWidth = image.naturalWidth || image.width;

                if (imageWidth > SCROLL_INDICATOR_IMAGE_WIDTH_THRESHOLD) {
                    scrollIndicator.classList.add('show');
                    
                    // 이미지 로드 후 레이아웃 계산 완료를 보장
                    requestAnimationFrame(() => {
                        requestAnimationFrame(() => {
                            // data-scroll-position 속성에서 값 읽기 (없으면 50%)
                            const scrollPosition = tabDetailImageWrap.dataset.scrollPosition !== undefined
                                ? parseFloat(tabDetailImageWrap.dataset.scrollPosition)
                                : 50;
                            
                            const scrollPercentage = scrollPosition / 100;
                            
                            // 실제 스크롤 가능한 요소의 스크롤 위치 설정
                            const scrollableWidth = tabDetailImageWrap.scrollWidth - tabDetailImageWrap.clientWidth;
                            if (scrollableWidth > 0) {
                                tabDetailImageWrap.scrollLeft = scrollableWidth * scrollPercentage;
                            }
                            
                            checkCount++;
                            if (checkCount === totalCount) {
                                setTimeout(() => {
                                    resolve();
                                }, 50);
                            }
                        });
                    });
                } else {
                    scrollIndicator.classList.remove('show');
                    checkCount++;
                    if (checkCount === totalCount) resolve();
                }
            }
        });
    });
}


/**
 * 탭 디테일 이미지 스크롤 인디케이터 터치/클릭 시 숨김 처리
 * 사용자 인터랙션 감지 시 인디케이터를 페이드 아웃
 */
function initTabDetailScrollIndicatorHide() {
    const tabDetailImgs = document.querySelectorAll('.tab-detail-img');
    
    tabDetailImgs.forEach((tabDetailImg) => {
        const tabDetailImageWrap = tabDetailImg.querySelector('.tab-detail-img-wrap');
        const scrollIndicator = tabDetailImg.querySelector('.scroll-indicator');

        if (!tabDetailImageWrap || !scrollIndicator) return;

        const hideIndicator = () => {
            scrollIndicator.classList.add(CLASS_NAMES.ACTIVE);
        };

        // tab-detail-img 영역 터치/클릭 시 인디케이터 숨김
        tabDetailImg.addEventListener('touchstart', hideIndicator, { once: true });
        tabDetailImg.addEventListener('click', hideIndicator, { once: true });
        // 실제 스크롤이 일어나는 요소(.tab-detail-img-wrap)에 스크롤 이벤트 등록
        tabDetailImageWrap.addEventListener('scroll', hideIndicator, { once: true });
    });
}


/**
 * Layer Popup 컨텐츠 렌더링
 * 
 * @param {number} index - 부스 인덱스 (0-9)
 */
function renderLayerContent(index) {
    const layerContent = document.querySelector(".layer-content");
    if (!layerContent || index < 0 || index >= layerPopupData.length) return;

    const data = layerPopupData[index];

    // 모바일 체크
    const isMobileDevice = window.innerWidth < BREAKPOINT_TABLET;

  // tablist 유무 확인
  const hasTablist = data.tablist && data.tablist.length > 0;

    // Tablist HTML 생성 (모든 탭 비활성 상태로 시작)
    const tablistHTML = hasTablist ?
        `
    <ul class="layer-sub-tabs" role="tablist">
      ${data.tablist
        .map((tab, tabIndex) => {
          // 모바일용: product-item들을 직접 생성 (초기 상태는 숨김)
          const mobileProductItems =
            isMobileDevice && tab.productList && tab.productList.length > 0
            ? `<div class="mobile-product-list hidden">
             ${tab.productList
               .map((product) =>
                 generateProductItemHTML(product, tab.productList)
               )
               .join("")}
           </div>`
            : "";

        return `
        <li role="presentation">
          <button 
            role="tab" 
            id="${tab.id}" 
            aria-selected="false"
            class="layer-tab-btn"
            data-bg="${tab.bg || ""}"
            data-title="${tab.title || ""}"
            data-description="${tab.description || ""}"
          >
            ${tab.name}
          </button>
            <div class="tab-detail tab-detail-${index + 1}">
              <div class="tab-detail-title-wrap">
                ${!isMobileDevice ? `<span class="tab-detail-subtitle">${tab.name}</span>` : ''}
                <h4 class="tab-detail-title">${tab.title || ""}</h4>
                <p class="tab-detail-desc">${tab.description || ""}</p>
                ${isMobileDevice ? (
                  tab.tabImgScroll 
                    ? `
                  <div class="tab-detail-img">
                    <div class="tab-detail-img-wrap" data-scroll-position="${tab.initialScrollPosition !== undefined ? tab.initialScrollPosition : 50}">
                      <img src="/theme/rbFront/img/m/ise/ise2026/booth_layer_bg_${index + 1}_tab_${tabIndex + 1}.jpg" alt="${tab.name}">
                    </div>
                    <div class="scroll-indicator">
                      <svg width="78" height="79" viewBox="0 0 78 79" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <ellipse cx="39" cy="39.5" rx="39" ry="39.5" fill="black" fill-opacity="0.5"/>
                        <g class="ic-pointer">
                          <path d="M35.1582 47.1134L34.8719 27.1154C34.8561 26.011 35.7386 25.1028 36.8431 25.087C37.9475 25.0712 38.8557 25.9537 38.8715 27.0582L39.0862 42.0566L39.0146 37.0572C38.9988 35.9527 39.8813 35.0445 40.9858 35.0287C42.0903 35.0129 42.9984 35.8954 43.0142 36.9999L43.0858 41.9994L43.0285 37.9998C43.0127 36.8953 43.8952 35.9872 44.9997 35.9714C46.1042 35.9556 47.0123 36.8381 47.0281 37.9425L47.0854 41.9421L47.0568 39.9423C47.0409 38.8379 47.9235 37.9297 49.0279 37.9139C50.1324 37.8981 51.0405 38.7806 51.0564 39.8851L51.1422 45.8845" stroke="white" stroke-linecap="round"/>
                          <path d="M35 47C32.8803 44.9115 30.45 41.9305 29.6802 41.2496C29.5493 41.1338 29.3782 41.0807 29.2063 41.0491C27.9018 40.8086 26.9992 41.4922 26.4729 42.2173C26.0993 42.7321 26.213 43.4167 26.5736 43.9405L33.4961 53.9943C33.4981 53.9973 33.5023 53.9976 33.5048 53.9951C33.5074 53.9926 33.5116 53.993 33.5136 53.996C35.1278 56.41 37.878 58 41 58H42C46.9706 58 51 53.9705 51 49V44" stroke="white" stroke-linecap="round"/>
                        </g>
                        <path d="M53.3536 28.3535C53.5488 28.1583 53.5488 27.8417 53.3536 27.6464L50.1716 24.4645C49.9763 24.2692 49.6597 24.2692 49.4645 24.4645C49.2692 24.6597 49.2692 24.9763 49.4645 25.1716L52.2929 28L49.4645 30.8284C49.2692 31.0237 49.2692 31.3403 49.4645 31.5355C49.6597 31.7308 49.9763 31.7308 50.1716 31.5355L53.3536 28.3535ZM43 28V28.5H53V28V27.5H43V28Z" fill="white"/>
                        <path d="M21.6464 28.3535C21.4512 28.1583 21.4512 27.8417 21.6464 27.6464L24.8284 24.4645C25.0237 24.2692 25.3403 24.2692 25.5355 24.4645C25.7308 24.6597 25.7308 24.9763 25.5355 25.1716L22.7071 28L25.5355 30.8284C25.7308 31.0237 25.7308 31.3403 25.5355 31.5355C25.3403 31.7308 25.0237 31.7308 24.8284 31.5355L21.6464 28.3535ZM32 28V28.5H22V28V27.5H32V28Z" fill="white"/>
                      </svg>
                    </div>
                  </div>
                    `
                    : `
                  <img src="/theme/rbFront/img/m/ise/ise2026/booth_layer_bg_${index + 1}_tab_${tabIndex + 1}.jpg" alt="${tab.name}" class="tab-detail-img">
                    `
                ) : ''}
            </div>
            ${mobileProductItems}
          </div>
        </li>
      `;
      })
      .join("")}
  </ul>
` :
      "";

  // 탭의 배경 이미지들을 미리 로드 (깜빡임 방지)
  if (hasTablist) {
      data.tablist.forEach((tab) => {
          if (tab.bg) {
              const img = new Image();
              img.src = tab.bg;
          }
      });
  }

  // Product List HTML 생성
  let productListHTML = "";

    if (hasTablist && data.tablist) {
        // tablist가 있을 때: 데스크톱에서만 탭별로 개별 생성
        productListHTML = !isMobileDevice ?
          data.tablist
          .map((tab, tabIdx) => {
              if (!tab.productList || tab.productList.length === 0) return "";

              return `
      <div class="layer-product-list has-tabs closed" data-tab-id="${tab.id}">
        <button type="button" class="close-product-btn">menu</button>
        <h4 class="product-list-title">${tab.subname}</h4>
        <div class="product-slider">
          <div class="swiper">
            <div class="swiper-wrapper">
              ${tab.productList
                .map((product, idx) => {
                  return `
                  <div class="swiper-slide">
                    ${generateProductItemHTML(product, tab.productList)}
                  </div>
                `;
                })
                .join("")}
            </div>
          </div>
          <div class="slide-prev"></div>
          <div class="slide-next"></div>
        </div>
      </div>
    `;
          })
          .join("") :
          "";
  } else if (data.productList && data.productList.length > 0) {
      // tablist가 없을 때: 최상위 productList 사용
      productListHTML = `
    <div class="layer-product-list no-tabs">
      <div class="product-slider">
        <div class="swiper">
          <div class="swiper-wrapper">
            ${data.productList
              .map((product, idx) => {
                return `
                <div class="swiper-slide">
                  ${generateProductItemHTML(product, data.productList)}
                </div>
              `;
              })
              .join("")}
          </div>
        </div>
        <div class="slide-prev"></div>
        <div class="slide-next"></div>
      </div>
    </div>
  `;
  }

  // 컨텐츠 HTML 생성
  const contentHTML = `
  <div class="layer-content-inner">
    <div class="booth-detail-img">
      <div class="booth-detail-img-wrap${data.disableScroll ? ' no-scroll' : ''}">
        <img src="/theme/rbFront/img/m/ise/ise2026/booth_detail_img_${
          index + 1
        }.jpg" alt="${data.title}">
      </div>
      ${!data.disableScroll ? `<div class="scroll-indicator">
        <svg width="78" height="79" viewBox="0 0 78 79" fill="none" xmlns="http://www.w3.org/2000/svg">
          <ellipse cx="39" cy="39.5" rx="39" ry="39.5" fill="black" fill-opacity="0.5"/>
          <g class="ic-pointer">
            <path d="M35.1582 47.1134L34.8719 27.1154C34.8561 26.011 35.7386 25.1028 36.8431 25.087C37.9475 25.0712 38.8557 25.9537 38.8715 27.0582L39.0862 42.0566L39.0146 37.0572C38.9988 35.9527 39.8813 35.0445 40.9858 35.0287C42.0903 35.0129 42.9984 35.8954 43.0142 36.9999L43.0858 41.9994L43.0285 37.9998C43.0127 36.8953 43.8952 35.9872 44.9997 35.9714C46.1042 35.9556 47.0123 36.8381 47.0281 37.9425L47.0854 41.9421L47.0568 39.9423C47.0409 38.8379 47.9235 37.9297 49.0279 37.9139C50.1324 37.8981 51.0405 38.7806 51.0564 39.8851L51.1422 45.8845" stroke="white" stroke-linecap="round"/>
            <path d="M35 47C32.8803 44.9115 30.45 41.9305 29.6802 41.2496C29.5493 41.1338 29.3782 41.0807 29.2063 41.0491C27.9018 40.8086 26.9992 41.4922 26.4729 42.2173C26.0993 42.7321 26.213 43.4167 26.5736 43.9405L33.4961 53.9943C33.4981 53.9973 33.5023 53.9976 33.5048 53.9951C33.5074 53.9926 33.5116 53.993 33.5136 53.996C35.1278 56.41 37.878 58 41 58H42C46.9706 58 51 53.9705 51 49V44" stroke="white" stroke-linecap="round"/>
          </g>
          <path d="M53.3536 28.3535C53.5488 28.1583 53.5488 27.8417 53.3536 27.6464L50.1716 24.4645C49.9763 24.2692 49.6597 24.2692 49.4645 24.4645C49.2692 24.6597 49.2692 24.9763 49.4645 25.1716L52.2929 28L49.4645 30.8284C49.2692 31.0237 49.2692 31.3403 49.4645 31.5355C49.6597 31.7308 49.9763 31.7308 50.1716 31.5355L53.3536 28.3535ZM43 28V28.5H53V28V27.5H43V28Z" fill="white"/>
          <path d="M21.6464 28.3535C21.4512 28.1583 21.4512 27.8417 21.6464 27.6464L24.8284 24.4645C25.0237 24.2692 25.3403 24.2692 25.5355 24.4645C25.7308 24.6597 25.7308 24.9763 25.5355 25.1716L22.7071 28L25.5355 30.8284C25.7308 31.0237 25.7308 31.3403 25.5355 31.5355C25.3403 31.7308 25.0237 31.7308 24.8284 31.5355L21.6464 28.3535ZM32 28V28.5H22V28V27.5H32V28Z" fill="white"/>
        </svg>
      </div>` : ''}
    </div>
    <div class="layer-content-title-wrap">
      <h3 class="layer-content-title">
        <span>${index + 1}.&nbsp;</span>
        ${data.title}
      </h3>
      <img src="/theme/rbFront/img/m/ise/ise2026/booth_location_${index + 1}.png" alt="${data.title} location" class="booth-location">
    </div>
    <div class="tablist-wrap">
        <button type="button" class="home-btn active">Home</button>
      ${tablistHTML}
    </div>
    ${productListHTML}
  </div>
`;

  // video-layer 보존하기 위해 임시 저장
  const videoLayer = layerContent.querySelector(".video-layer");

  // innerHTML 설정
  layerContent.innerHTML = contentHTML;

  // video-layer가 있었다면 다시 추가
  if (videoLayer) {
      layerContent.appendChild(videoLayer);
  }

  // innerHTML 설정 후 배경 이미지 설정 (defaultBg) - 데스크톱 전용
  layerContent.style.backgroundImage = `url('${data.defaultBg}')`;
  layerContent.setAttribute("data-default-bg", data.defaultBg); // defaultBg 저장 (home-btn 클릭 시 복원용)

  layerContent.classList.remove("active"); // 초기 상태: 비활성화
  layerContent.classList.remove("has-active-subtab"); // 초기 상태에서는 home-btn 숨김

  // tablist 유무에 따라 조건부 클래스 추가
  layerContent.classList.remove("has-tablist", "no-tablist");
  if (hasTablist) {
      layerContent.classList.add("has-tablist");
  } else {
      layerContent.classList.add("no-tablist");
  }

  // 준비중인 제품 링크에 이벤트 바인딩
  layerContent
      .querySelectorAll('.product-item[data-coming-soon="true"]')
      .forEach((item) => {
          item.addEventListener("click", handleComingSoonProduct);
      });

  // 스크롤 인디케이터 체크 및 이벤트 초기화
  setTimeout(async () => {
      await checkScrollIndicator(index); // 스크롤 설정 완료 대기
      initScrollIndicatorHide(); // 그 다음에 이벤트 리스너 등록
      await checkTabDetailScrollIndicator(); // 탭 디테일 이미지 스크롤 체크
      initTabDetailScrollIndicatorHide(); // 탭 디테일 이미지 이벤트 리스너 등록
    }, 100);
}


/**
 * Layer Popup 열기
 * 
 * @param {number} index - 부스 인덱스 (0-9)
 */
async function openLayerPopup(index) {
  console.log(`[DEBUG] openLayerPopup 호출: index=${index}, booth-${index + 1}`);
  const layerPop = document.querySelector(".layer-pop");
  const layerTabItems = document.querySelectorAll(".layer-tab-item");

  if (!layerPop) return;

  // 모든 탭의 active 클래스 제거
  layerTabItems.forEach((item) => item.classList.remove("active"));

  // 해당 index의 탭 활성화
  if (layerTabItems[index]) {
      layerTabItems[index].classList.add("active");
  }

  // 컨텐츠 렌더링
  renderLayerContent(index);

  // dropdown 텍스트 초기화 (모바일)
  const dropdownBtnSpan = document.querySelector(
      ".layer-pop .dropdown-btn span"
  );
  const activeTabBtn = document.querySelectorAll(
      ".layer-nav-tabs .layer-tab-btn"
  )[index];
  if (dropdownBtnSpan && activeTabBtn) {
      dropdownBtnSpan.textContent = `${
    index + 1
  }. ${activeTabBtn.textContent.trim()}`;
  }

  // Product Swiper를 먼저 초기화 (레이아웃 무너짐 방지)
  initProductSwiper();

  // body scroll 방지 - 클래스로 처리
  document.body.classList.add(CLASS_NAMES.LAYER_OPEN);

  // Swiper 초기화 완료 후 레이어 표시 (약간의 지연으로 DOM 조작 완료 보장)
  setTimeout(() => {
      layerPop.classList.add("active");
  }, 50);
}


/**
 * Layer Popup 닫기
 */
function closeLayerPopup() {
  const layerPop = document.querySelector(".layer-pop");
  const layerTabItems = document.querySelectorAll(".layer-tab-item");

  const layerNavTabs = document.querySelector(".layer-nav-tabs-wrap");
  if (!layerPop || !layerNavTabs) return;

  // video-layer도 함께 닫기
  closeVideoLayer();

  // 레이어 팝업 비활성화
  layerPop.classList.remove("active");

  layerNavTabs.classList.remove("active");

  // 모든 탭의 active 클래스 제거
  layerTabItems.forEach((item) => item.classList.remove("active"));

  // body scroll 복원 - 클래스 제거
  document.body.classList.remove(CLASS_NAMES.LAYER_OPEN);

  // 레이어 애니메이션 완료 후 Product Swiper 인스턴스 제거 (300ms transition + 여유 50ms)
  // 이렇게 하면 레이어가 사라지는 동안 레이아웃이 무너지지 않습니다
  setTimeout(() => {
      productSwiperInstances.forEach((swiper) => {
          if (swiper) {
              swiper.destroy(true, true);
          }
      });
      productSwiperInstances.clear();
  }, 350);
}


// ============================================================================
// 11. VIDEO LAYER (GALLERY)
// ============================================================================

/**
 * Video Layer (Photos Gallery) 관련 전역 변수
 */
let mainGallerySwiper = null;
let thumbGallerySwiper = null;
let galleryBreakpointState = null;


/**
 * Video Layer (Photos Gallery) 열기
 * 
 * @param {number} index - 부스 인덱스 (0-9)
 */
async function openVideoLayer(index) {
  console.log(`[DEBUG] openVideoLayer 호출: index=${index}, booth-${index + 1}`);
  const videoLayer = document.querySelector(".video-layer");
  const data = layerPopupData[index];

  if (!videoLayer || !data.mediaGallery) return;

  // 부스 이름 설정
  const boothNameEl = videoLayer.querySelector(".booth-name");
  if (boothNameEl) {
      boothNameEl.textContent = data.title;
  }

  // 갤러리 렌더링
  renderMediaGallery(data.mediaGallery);

  // Swiper를 먼저 초기화 (레이아웃 무너짐 방지)
  initMediaGallerySwiper();

  // Swiper 초기화 완료 후 레이어 표시 (약간의 지연으로 DOM 조작 완료 보장)
  setTimeout(() => {
      videoLayer.classList.add("active");
    }, 50);
}


/**
 * Video Layer 닫기
 */
function closeVideoLayer() {
  const videoLayer = document.querySelector(".video-layer");
  if (!videoLayer) return;

  videoLayer.classList.remove("active");

  // photo-btn의 active 클래스도 제거
  const photoBtn = document.querySelector(".layer-tab .photo-btn");
  if (photoBtn) {
      photoBtn.classList.remove("active");
  }

  // layer-content-inner의 active 클래스도 제거
  const layerContentInner = document.querySelector(".layer-content-inner");
  if (layerContentInner) {
      layerContentInner.classList.remove("active");
  }

  // 레이어 애니메이션 완료 후 Swiper 인스턴스 제거 (300ms transition + 여유 50ms)
  // 이렇게 하면 레이어가 사라지는 동안 레이아웃이 무너지지 않습니다
  setTimeout(() => {
      if (mainGallerySwiper) {
          mainGallerySwiper.destroy();
          mainGallerySwiper = null;
      }
      if (thumbGallerySwiper) {
          thumbGallerySwiper.destroy();
          thumbGallerySwiper = null;
      }
    }, 350);
}


/**
 * 미디어 갤러리 렌더링 (이미지 + 유튜브 동영상)
 * 
 * @param {Array} mediaGallery - 미디어 아이템 배열
 */
function renderMediaGallery(mediaGallery) {
  console.log(`[DEBUG] renderMediaGallery 호출: 총 ${mediaGallery.length}개 아이템`);
  console.log(`[DEBUG] 렌더링할 아이템:`, mediaGallery);
  
  const mainWrapper = document.querySelector(
      ".main-gallery-swiper .swiper-wrapper"
  );
  const thumbWrapper = document.querySelector(
      ".thumb-gallery-swiper .swiper-wrapper"
  );

  if (!mainWrapper || !thumbWrapper) return;

  // 메인 슬라이드 생성
  const mainSlides = mediaGallery
      .map((item) => {
          if (item.type === "youtube") {
              const videoTitle = item.title || "LG at ISE 2026";
              return `
      <div class="swiper-slide">
        <div class="video-item">
          <img src="${item.thumbnail}" alt="${videoTitle}">
          <div class="txt-bx">
            <p class="title">${videoTitle}</p>
          </div>
          <a href="${item.youtubeUrl}" target="_blank" rel="noopener noreferrer" class="youtube-link"> Learn more</a>
        </div>
      </div>
    `;
          } else {
              return `
      <div class="swiper-slide">
        <img src="${item.imageUrl}" alt="LG at ISE 2026">
      </div>
    `;
          }
      })
      .join("");

  // 썸네일 슬라이드 생성
  const thumbSlides = mediaGallery
      .map((item) => {
          const thumbUrl = item.type === "youtube" ? item.thumbnail : item.imageUrl;
          const iconClass = item.type === "youtube" ? "has-play-icon" : "";
          const altText =
              item.type === "youtube" && item.title ? item.title : "LG at ISE 2026";
          return `
    <div class="swiper-slide ${iconClass}">
      <img src="${thumbUrl}" alt="${altText}">
    </div>
  `;
      })
      .join("");

  mainWrapper.innerHTML = mainSlides;
    thumbWrapper.innerHTML = thumbSlides;
}


/**
 * 미디어 갤러리 Swiper 초기화 (데스크톱 전용)
 * 모바일에서는 Swiper를 생성하지 않음
 */
function initMediaGallerySwiper() {
  // 기존 인스턴스 제거
  if (mainGallerySwiper) mainGallerySwiper.destroy();
  if (thumbGallerySwiper) thumbGallerySwiper.destroy();

  // 768px 이하 모바일에서는 스와이퍼 생성하지 않음
  const isDesktop = window.innerWidth > 768;

  if (!isDesktop) {
      galleryBreakpointState = "mobile";
      mainGallerySwiper = null;
      thumbGallerySwiper = null;
      return;
  }

  galleryBreakpointState = "desktop";

  // Thumbs Swiper 먼저 초기화 (데스크톱만)
  thumbGallerySwiper = new Swiper(".thumb-gallery-swiper", {
      slidesPerView: 5,
      spaceBetween: 14,
      watchSlidesProgress: true,
      direction: "vertical",
      navigation: {
          nextEl: ".thumb-slide-next",
          prevEl: ".thumb-slide-prev",
      },
      breakpoints: {
          768: {
              slidesPerView: 5,
              spaceBetween: 9,
          },
          1280: {
              slidesPerView: 5,
              spaceBetween: 14,
          },
      },
  });

  // Main Swiper 초기화 (thumbs 연결)
  mainGallerySwiper = new Swiper(".main-gallery-swiper", {
      slidesPerView: 1,
      spaceBetween: 0,
      effect: "fade",
      thumbs: {
          swiper: thumbGallerySwiper,
      },
      pagination: {
          el: ".main-swiper-container .swiper-pagination",
          type: "fraction",
      },
    });
}


// ============================================================================
// 12. PRODUCT SWIPER
// ============================================================================

/**
 * Product Swiper 관련 전역 변수
 */
let productSwiperInstances = new Map();
let productSwiperBreakpoint = null;


/**
 * Product Swiper 초기화
 * 모바일에서는 비활성화, 데스크톱/태블릿에서만 활성화
 */
function initProductSwiper() {
  const isMobile = window.innerWidth < 769;

  if (isMobile) {
      // 모바일: 모든 Swiper destroy
      productSwiperInstances.forEach((swiper) => {
          if (swiper) swiper.destroy(true, true);
      });
      productSwiperInstances.clear();
      productSwiperBreakpoint = "mobile";
      return;
  }

  // 데스크톱/태블릿: Swiper 생성
  productSwiperBreakpoint = "desktop";
  const productSliders = document.querySelectorAll(
      ".layer-product-list .product-slider .swiper"
  );

  productSliders.forEach((slider) => {
      // 이미 초기화된 경우 건너뛰기
      if (productSwiperInstances.has(slider)) return;

      // 슬라이드 개수 확인
      const slideCount = slider.querySelectorAll(".swiper-slide").length;

      // 현재 슬라이더의 부모에서 버튼 찾기
      const container = slider.parentElement;
      const nextBtn = container.querySelector(".slide-next");
      const prevBtn = container.querySelector(".slide-prev");

      const swiper = new Swiper(slider, {
          slidesPerView: 1,
          spaceBetween: 16,
          navigation: {
              nextEl: nextBtn,
              prevEl: prevBtn,
          },
          breakpoints: {
              768: {
                  slidesPerView: 3,
                  spaceBetween: 5,
              },
              1280: {
                  slidesPerView: 3,
                  spaceBetween: 8,
              },
          },
      });

      productSwiperInstances.set(slider, swiper);

      // PC에서 슬라이드가 3개 이하면 네비게이션 버튼 숨김
      if (slideCount <= 3) {
          if (nextBtn) nextBtn.style.display = "none";
          if (prevBtn) prevBtn.style.display = "none";
      }
    });
}


/**
 * Product 아코디언 토글 처리 (모바일 전용)
 */
function initProductAccordion() {
  const layerContent = document.querySelector(".layer-content");
  if (!layerContent) return;

  layerContent.addEventListener("click", (e) => {
      const toggle = e.target.closest(".accordion-toggle");
      if (!toggle) return;

      // 모바일에서만 동작
      if (window.innerWidth >= 768) return;

      const item = toggle.closest(".product-item");
      if (!item) return;

      // 토글
      const isActive = item.classList.toggle("active");
      toggle.setAttribute("aria-expanded", isActive);
    });
}


// ============================================================================
// 13. EVENT HANDLERS
// ============================================================================

/**
 * Layer Popup 이벤트 핸들러 초기화
 * 모든 레이어 팝업 관련 이벤트 리스너 등록
 */
function handleLayerPopup() {
  // 1. Learn more 버튼 클릭 이벤트
  const learnMoreButtons = document.querySelectorAll(
      ".booth-map .booth-bx .btn"
  );

  learnMoreButtons.forEach((button) => {
      button.addEventListener("click", () => {
          // 버튼의 data-booth-index 속성에서 직접 인덱스 가져오기
          const boothIndex = button.getAttribute("data-booth-index");
          
          if (boothIndex !== null) {
              const layerIndex = parseInt(boothIndex, 10);
              
              // 유효한 인덱스 범위 확인 (0-9: Booth 1-10)
              if (layerIndex >= 0 && layerIndex < 10) {
                  openLayerPopup(layerIndex);
              }
          }
      });
  });

  // 2. 닫기 버튼 클릭 이벤트
  const closeBtn = document.querySelector(".layer-pop .close-btn");
  if (closeBtn) {
      closeBtn.addEventListener("click", closeLayerPopup);
  }

  // 2-1. Photos 버튼 클릭 이벤트 (토글)
  const photoBtn = document.querySelector(".layer-tab .photo-btn");
  if (photoBtn) {
      photoBtn.addEventListener("click", async () => {
          const videoLayer = document.querySelector(".video-layer");
          const layerContentInner = document.querySelector(".layer-content-inner");

          // video-layer가 이미 열려있으면 닫기
          if (videoLayer && videoLayer.classList.contains("active")) {
              closeVideoLayer();
              photoBtn.classList.remove("active");

              // layer-content-inner에서 active 제거
              if (layerContentInner) {
                  layerContentInner.classList.remove("active");
              }
          } else {
              // 닫혀있으면 열기
              const layerTabItems = document.querySelectorAll(".layer-tab-item");
              const activeTabItem = document.querySelector(".layer-tab-item.active");
              const activeIndex = Array.from(layerTabItems).indexOf(activeTabItem);

              if (activeIndex >= 0 && activeIndex < layerPopupData.length) {
                  await openVideoLayer(activeIndex);
                  photoBtn.classList.add("active");

                  // layer-content-inner에 active 추가
                  if (layerContentInner) {
                      layerContentInner.classList.add("active");
                  }
              }
          }
      });
  }

  // 2-2. Video Layer 닫기 버튼 클릭 이벤트
  const videoCloseBtn = document.querySelector(".video-close-btn");
  if (videoCloseBtn) {
      videoCloseBtn.addEventListener("click", closeVideoLayer);
  }

  // 2-3. Dropdown 버튼 클릭 이벤트 (모바일 전용)
  const dropdownBtn = document.querySelector(".layer-pop .dropdown-btn");
  if (dropdownBtn) {
      dropdownBtn.addEventListener("click", () => {
          const layerNavTabs = document.querySelector(".layer-nav-tabs-wrap");
          if (layerNavTabs) {
              layerNavTabs.classList.toggle("active");
          }
      });
  }

  // 2-4. Back 버튼 클릭 이벤트 (모바일 전용 - dropdown 메뉴 닫기)
  const backBtn = document.querySelector(".layer-nav-tabs-wrap .back-btn");
  if (backBtn) {
      backBtn.addEventListener("click", () => {
          const layerNavTabs = document.querySelector(".layer-nav-tabs-wrap");
          if (layerNavTabs) {
              layerNavTabs.classList.remove("active");
          }
      });
  }

  // 3. 레이어 탭 버튼 클릭 이벤트 (외부 탭: layer-tab-item)
  const layerTabButtons = document.querySelectorAll(
      ".layer-nav-tabs .layer-tab-btn"
  );

  layerTabButtons.forEach((button, index) => {
      button.addEventListener("click", () => {
          const layerTabItems = document.querySelectorAll(".layer-tab-item");
          const layerContent = document.querySelector(".layer-content");

          // dropdown 텍스트 업데이트 (모바일)
          const dropdownBtnSpan = document.querySelector(
              ".layer-pop .dropdown-btn span"
          );
          if (dropdownBtnSpan) {
              dropdownBtnSpan.textContent = `${
        index + 1
      }. ${button.textContent.trim()}`;
          }

          // dropdown 메뉴 닫기 (모바일)
          const layerNavTabs = document.querySelector(".layer-nav-tabs-wrap");
          if (layerNavTabs) {
              layerNavTabs.classList.remove("active");
          }

          // 탭 변경 시 video-layer 닫기
          closeVideoLayer();

          // 모든 탭의 active 클래스 제거
          layerTabItems.forEach((item) => item.classList.remove("active"));

          // 클릭한 탭 활성화
          if (layerTabItems[index]) {
              layerTabItems[index].classList.add("active");
          }

          // fade 효과와 함께 컨텐츠 렌더링
          if (layerContent) {
              layerContent.style.opacity = "0";

              setTimeout(() => {
                  // transition을 일시적으로 비활성화
                  const originalTransition = layerContent.style.transition;
                  layerContent.style.transition = "none";

                  // 배경 이미지를 즉시 변경 (opacity: 0 상태에서, transition 없이)
                  const data = layerPopupData[index];
                  layerContent.style.backgroundImage = `url('${data.defaultBg}')`;
                  layerContent.setAttribute("data-default-bg", data.defaultBg);

                  // 강제 reflow로 transition: none이 적용되도록 함
                  void layerContent.offsetHeight;

                  // transition 복원
                  layerContent.style.transition = originalTransition;

                  // 컨텐츠 렌더링
                  renderLayerContent(index);
                  layerContent.style.opacity = "1";

                  // home-btn 숨김 (renderLayerContent에서도 제거하지만 명시적으로 추가)
                  layerContent.classList.remove("has-active-subtab");

                  // photo-btn 표시
                  const photoBtn = document.querySelector(".layer-tab .photo-btn");
                  if (photoBtn) {
                      photoBtn.classList.remove("is-hidden");
                  }

                  // 컨텐츠 렌더링 후 Swiper 재초기화
                  setTimeout(() => {
                      initProductSwiper();
                  }, 100);
              }, 300);
          } else {
              renderLayerContent(index);
              // 컨텐츠 렌더링 후 Swiper 재초기화
              setTimeout(() => {
                  initProductSwiper();
              }, 100);
          }
      });
  });

  // 4. 컨텐츠 내부 tablist 탭 클릭 이벤트 및 home-btn 클릭 이벤트
  // 이벤트 위임 방식 사용 (동적으로 생성되는 요소이므로)
  const layerContent = document.querySelector(".layer-content");
  if (layerContent) {
      layerContent.addEventListener("click", (e) => {
          // home-btn 클릭 처리
          const homeBtn = e.target.closest(".home-btn");
          if (homeBtn) {
              // 모든 내부 탭 비활성화
              const allSubTabs = layerContent.querySelectorAll(
                  ".layer-sub-tabs .layer-tab-btn"
              );
              allSubTabs.forEach((tab) => {
                  tab.classList.remove("active");
                  tab.setAttribute("aria-selected", "false");
              });

              // 모든 tab-detail 숨기기
              const allTabDetails = layerContent.querySelectorAll(".tab-detail");
              allTabDetails.forEach((detail) => detail.classList.remove("active"));

              // 배경 이미지를 defaultBg로 복원 - 데스크톱 전용
              const defaultBg = layerContent.getAttribute("data-default-bg");
              if (defaultBg) {
                  layerContent.style.backgroundImage = `url('${defaultBg}')`;
              }

              // 모든 product-list 숨김
              const allProductLists = layerContent.querySelectorAll(
                  ".layer-product-list"
              );
              allProductLists.forEach((list) => list.classList.add("closed"));

              // layer-content-title에서 active 클래스 제거
              const contentTitle = layerContent.querySelector(".layer-content-title");
              if (contentTitle) {
                  contentTitle.classList.remove("active");
              }

              // home-btn 활성화
              homeBtn.classList.add("active");

              // home-btn 숨김
              layerContent.classList.remove("has-active-subtab");
              layerContent.classList.remove("active");

              // photo-btn 표시
              const photoBtn = document.querySelector(".layer-tab .photo-btn");
              if (photoBtn) {
                  photoBtn.classList.remove("is-hidden");
              }

              return;
          }

          // close-product-btn 클릭 처리
          const closeProductBtn = e.target.closest(".close-product-btn");
          if (closeProductBtn) {
              const productList = closeProductBtn.closest(".layer-product-list");
              if (productList) {
                  productList.classList.add("closed");
              }

              // layer-content-title에서 active 클래스 제거
              const contentTitle = layerContent.querySelector(".layer-content-title");
              if (contentTitle) {
                  contentTitle.classList.remove("active");
              }

              return;
          }

          // 클릭한 요소가 layer-sub-tabs 내부의 탭 버튼인지 확인
          const clickedTab = e.target.closest(".layer-sub-tabs .layer-tab-btn");
          if (!clickedTab) return;

          // 모바일 체크
          const isMobile = window.innerWidth < 769;

          // 이미 활성화된 탭을 다시 클릭한 경우
          if (clickedTab.classList.contains("active")) {
              if (isMobile) {
                  // 모바일: 탭 비활성화 (토글)
                  clickedTab.classList.remove("active");
                  clickedTab.setAttribute("aria-selected", "false");

                  // tab-detail 숨기기
                  const clickedTabDetail =
                      clickedTab.parentElement.querySelector(".tab-detail");
                  if (clickedTabDetail) {
                      clickedTabDetail.classList.remove("active");
                  }

                  // mobile-product-list 숨기기
                  const mobileProductList =
                      clickedTab.parentElement.querySelector(".mobile-product-list");
                  if (mobileProductList) {
                      mobileProductList.classList.add("hidden");
                  }

                  // layer-content에서 active 상태 제거
                  layerContent.classList.remove("active");
                  layerContent.classList.remove("has-active-subtab");

                  // 배경 이미지를 defaultBg로 복원
                  const defaultBg = layerContent.getAttribute("data-default-bg");
                  if (defaultBg) {
                      layerContent.style.backgroundImage = `url('${defaultBg}')`;
                  }

                  // home-btn 활성화
                  const homeBtnElement = layerContent.querySelector(".home-btn");
                  if (homeBtnElement) {
                      homeBtnElement.classList.add("active");
                  }

                  // photo-btn 표시
                  const photoBtn = document.querySelector(".layer-tab .photo-btn");
                  if (photoBtn) {
                      photoBtn.classList.remove("is-hidden");
                  }

                  return;
              } else {
                  // 데스크톱: product-list 토글 (기존 로직)
                  const targetProductList = layerContent.querySelector(
                      `[data-tab-id="${clickedTab.id}"]`
                  );
                  if (
                      targetProductList &&
                      targetProductList.classList.contains("closed")
                  ) {
                      // 닫혀있으면 다시 열기
                      targetProductList.classList.remove("closed");

                      // layer-content-title에 active 클래스 추가
                      const contentTitle = layerContent.querySelector(
                          ".layer-content-title"
                      );
                      if (contentTitle) {
                          contentTitle.classList.add("active");
                      }

                      // Swiper 재초기화
                      setTimeout(() => {
                          initProductSwiper();
                      }, 100);
                  }
                  return;
              }
          }

          // 같은 tablist 내의 모든 탭 찾기
          const tablist = clickedTab.closest(".layer-sub-tabs");
          if (!tablist) return;

          const allTabs = tablist.querySelectorAll(".layer-tab-btn");

          // 모든 탭의 active 상태 제거
          allTabs.forEach((tab) => {
              tab.classList.remove("active");
              tab.setAttribute("aria-selected", "false");
          });

          // 클릭한 탭 활성화
          clickedTab.classList.add("active");
          clickedTab.setAttribute("aria-selected", "true");

          // 모든 tab-detail 숨기기
          const allTabDetails = tablist.querySelectorAll(".tab-detail");
          allTabDetails.forEach((detail) => detail.classList.remove("active"));

          // 클릭한 탭의 tab-detail 표시
          const clickedTabDetail =
              clickedTab.parentElement.querySelector(".tab-detail");
          if (clickedTabDetail) {
              clickedTabDetail.classList.add("active");
          }

          // 모바일에서만 아코디언이 완전히 펼쳐진 후 스크롤
          if (isMobile) {
              // tab-detail의 transition이 완료될 때까지 대기 (0.3s + 여유시간)
              setTimeout(() => {
                  const layerPop = document.querySelector(".layer-pop");
                  if (layerPop && clickedTab) {
                      // sticky 요소들의 높이 계산
                      const layerTop = document.querySelector(".layer-pop .layer-top");
                      const layerTab = document.querySelector(".layer-pop .layer-tab");
                      const stickyHeight = (layerTop ? layerTop.offsetHeight : 0) + 
                                           (layerTab ? layerTab.offsetHeight : 0);
                      
                      // 버튼의 layer-pop 기준 위치 계산
                      const buttonRect = clickedTab.getBoundingClientRect();
                      const layerPopRect = layerPop.getBoundingClientRect();
                      const scrollOffset = buttonRect.top - layerPopRect.top + layerPop.scrollTop - stickyHeight;
                      
                      // 스크롤
                      layerPop.scrollTo({
                          top: scrollOffset,
                          behavior: 'smooth'
                      });
                  }
              }, 350); // 0.3s transition + 50ms 여유
          }

          // layer-content에 active 클래스 추가
          layerContent.classList.add("active");

          // home-btn 표시를 위한 클래스 추가
          layerContent.classList.add("has-active-subtab");

          // home-btn 비활성화
          const homeBtnElement = layerContent.querySelector(".home-btn");
          if (homeBtnElement) {
              homeBtnElement.classList.remove("active");
          }

          // photo-btn 숨김
          const photoBtn = document.querySelector(".layer-tab .photo-btn");
          if (photoBtn) {
              photoBtn.classList.add("is-hidden");
          }

          // layer-content-title에 active 클래스 추가
          const contentTitle = layerContent.querySelector(".layer-content-title");
          if (contentTitle) {
              contentTitle.classList.add("active");
          }

          // 배경 이미지를 탭의 bg로 즉시 변경 (fade 효과 없음) - 데스크톱 전용
          const tabBg = clickedTab.getAttribute("data-bg");
          if (tabBg) {
              layerContent.style.backgroundImage = `url('${tabBg}')`;
          }

          // 모바일: mobile-product-list 표시
          if (isMobile) {
              // 모든 mobile-product-list 숨기기
              const allMobileProductLists = layerContent.querySelectorAll(
                  ".mobile-product-list"
              );
              allMobileProductLists.forEach((list) => list.classList.add("hidden"));

              // 클릭한 탭의 mobile-product-list 표시
              const mobileProductList =
                  clickedTab.parentElement.querySelector(".mobile-product-list");
              if (mobileProductList) {
                  mobileProductList.classList.remove("hidden");
              }
          } else {
              // 데스크톱: layer-product-list 표시
              // 모든 product-list 숨김
              const allProductLists = layerContent.querySelectorAll(
                  ".layer-product-list"
              );
              allProductLists.forEach((list) => list.classList.add("closed"));

              // 클릭한 탭의 product-list 표시
              const targetProductList = layerContent.querySelector(
                  `[data-tab-id="${clickedTab.id}"]`
              );
              if (targetProductList) {
                  targetProductList.classList.remove("closed");

                  // Swiper 재초기화
                  setTimeout(() => {
                      initProductSwiper();
                  }, 100);
              }
          }
          
          // 탭 전환 시 스크롤 인디케이터 체크 (모바일)
          if (isMobile) {
              setTimeout(async () => {
                  await checkTabDetailScrollIndicator();
                  initTabDetailScrollIndicatorHide();
              }, 100);
          }
      });
  }

  // 5. 레이어 팝업 바깥 영역 클릭 시 닫기 (선택사항)
  const layerPop = document.querySelector(".layer-pop");
  if (layerPop) {
      layerPop.addEventListener("click", (e) => {
          // layer-pop-inner 바깥을 클릭한 경우에만 닫기
          if (e.target === layerPop) {
              closeLayerPopup();
          }
      });
  }

  // 6. 제품 리스트 초기화
  initProductSwiper();
  initProductAccordion();

  // 7. Product Swiper 리사이즈 핸들러
  let productResizeTimer;
  window.addEventListener("resize", () => {
      clearTimeout(productResizeTimer);
      productResizeTimer = setTimeout(() => {
          const isMobile = window.innerWidth < 769;
          const newState = isMobile ? "mobile" : "desktop";

          // 상태가 변경되었을 때만 재초기화
          if (newState !== productSwiperBreakpoint) {
              initProductSwiper();
          }
      }, 250);
  });

  // 8. Gallery Swiper 리사이즈 핸들러
  let galleryResizeTimer;
  window.addEventListener("resize", () => {
      clearTimeout(galleryResizeTimer);
      galleryResizeTimer = setTimeout(() => {
          const isDesktop = window.innerWidth > 768;
          const newState = isDesktop ? "desktop" : "mobile";

          // 상태가 변경되었을 때만 처리
          if (newState !== galleryBreakpointState) {
              if (newState === "mobile") {
                  // 데스크톱 → 모바일: Swiper destroy
                  if (mainGallerySwiper) {
                      mainGallerySwiper.destroy(true, true);
                      mainGallerySwiper = null;
                  }
                  if (thumbGallerySwiper) {
                      thumbGallerySwiper.destroy(true, true);
                      thumbGallerySwiper = null;
                  }
              } else {
                  // 모바일 → 데스크톱: Swiper 재생성
                  initMediaGallerySwiper();
              }
              galleryBreakpointState = newState;
          }
      }, 250);
  });

  // 9. Layer Content 브레이크포인트 변경 감지 (matchMedia 사용)
  const layerMediaQuery = window.matchMedia("(max-width: 768px)");
  const handleLayerMediaChange = () => {
      // layer-pop이 활성화된 상태인지 확인
      const layerPop = document.querySelector(".layer-pop");
      if (!layerPop || !layerPop.classList.contains("active")) return;

      // layer-content-inner의 active 상태 저장
      const layerContentInner = document.querySelector(".layer-content-inner");
      const wasActive = layerContentInner && layerContentInner.classList.contains("active");

      // 현재 활성화된 탭 인덱스 찾기
      const layerTabItems = document.querySelectorAll(".layer-tab-item");
      const activeTabItem = document.querySelector(".layer-tab-item.active");
      const activeIndex = Array.from(layerTabItems).indexOf(activeTabItem);

      if (activeIndex >= 0) {
          // 컨텐츠 재렌더링
          renderLayerContent(activeIndex);

          // layer-content-inner의 active 상태 복원
          if (wasActive) {
              const newLayerContentInner = document.querySelector(".layer-content-inner");
              if (newLayerContentInner) {
                  newLayerContentInner.classList.add("active");
              }
          }

          // Swiper 재초기화 및 스크롤 인디케이터 재체크
          setTimeout(async () => {
              initProductSwiper();
              await checkScrollIndicator(activeIndex); // 스크롤 설정 완료 대기
              initScrollIndicatorHide(); // 그 다음에 이벤트 리스너 등록
              await checkTabDetailScrollIndicator(); // 탭 디테일 이미지 스크롤 체크
              initTabDetailScrollIndicatorHide(); // 탭 디테일 이미지 이벤트 리스너 등록
          }, 100);
      }
  };

  // matchMedia change 이벤트 리스너 등록
  if (layerMediaQuery.addEventListener) {
      layerMediaQuery.addEventListener("change", handleLayerMediaChange);
  } else {
      // 구형 브라우저 지원
      layerMediaQuery.addListener(handleLayerMediaChange);
    }
}

// ============================================================================
// 14. LED MEDIA ART AUDIO CONTROL
// ============================================================================

/**
 * LED 미디어 아트 섹션의 음악 재생/정지 기능
 * 버튼 클릭 시 음악을 토글하고 버튼 텍스트를 변경합니다.
 */
function handleLedMediaAudio() {
  const btnPlay = document.querySelector('.led-media-art .btn-play');
  const audio = document.getElementById('ledMediaAudio');

  if (!btnPlay || !audio) return;

  // 볼륨을 고정값으로 설정 (0.0 ~ 1.0, 0.5 = 50%)
  audio.volume = 0.5;

  let isPlaying = false;

  // 재생/일시정지 상태 업데이트 함수
  const updatePlayState = (playing) => {
    isPlaying = playing;
    if (playing) {
      btnPlay.classList.add('playing');
    } else {
      btnPlay.classList.remove('playing');
    }
  };

  // 버튼 클릭 이벤트
  btnPlay.addEventListener('click', () => {
    if (isPlaying) {
      audio.pause();
      updatePlayState(false);
    } else {
      audio.play();
      updatePlayState(true);
    }
  });

  // Page Visibility API: 백그라운드 전환 시 자동 일시정지
  document.addEventListener('visibilitychange', () => {
    if (document.hidden && isPlaying) {
      audio.pause();
      updatePlayState(false);
    }
  });

  // Media Session API: 기기 미디어 컨트롤 지원
  if ('mediaSession' in navigator) {
    navigator.mediaSession.setActionHandler('play', () => {
      audio.play();
      updatePlayState(true);
    });
    
    navigator.mediaSession.setActionHandler('pause', () => {
      audio.pause();
      updatePlayState(false);
    });
  }
}

// ============================================================================
// 15. INITIALIZATION
// ============================================================================

/**
 * 모든 기능 초기화
 * 페이지 로드 시 실행되는 메인 초기화 함수
 */
async function init() {
  // initFadeUp();
  initKVVideo();
  initBoothSlide();
  handleFooterNavClick();
  handleBoothSlide();
  handleCultureSlide();
  handleTechzoneSlide();
  handleTechzoneNewsSlide();
  handleHighlightsSlide();
  handleLayerPopup();
  handleLedMediaAudio();

  new fullpage(".ise-container", {
      licenseKey: "5N617-S264H-TKC2I-1JR47-TTJWQ",
      scrollingSpeed: 1400,
      easingcss3: "cubic-bezier(0.645, 0.045, 0.355, 1.000)",
      navigation: true,
      anchors: [
        "ise2026",
        "key-attractor",
        "products-solutions",
        "k-brands-collaboration",
        "unveiled-led-technology",
        "highlights",
        "footer"
    ],
      navigationTooltips: [
          "ISE 2026",
          "Key Attractor",
          "Products & Solutions",
          "K-brands collaboration",
          "Unveiled LED Technology",
          "Highlights",
      ],
      showActiveTooltip: true,
      scrollOverflow: true, // 콘텐츠가 넘칠 때 섹션 내부 스크롤 활성화
      normalScrollElements: ".layer-pop, .layer-pop *",
      responsiveWidth: 1281, // 1081px 이하에서 fullpage 해제
      onLeave: function(origin, destination, direction) {
          const nav = document.querySelector("#fp-nav");

          // 다음 섹션이 3번 또는 4번이면 black 클래스 추가
          if (destination.index === 3 || destination.index === 4) {
              nav.classList.add("black");
          }
          // 현재 섹션이 3번 또는 4번이고, 다음 섹션이 아니면 black 클래스 제거
          else if (origin.index === 3 || origin.index === 4) {
              nav.classList.remove("black");
          }
      },
    });
}


// DOM 로드 후 초기화 실행
if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", init);
} else {
    init();
}


// 동적으로 추가된 요소를 위한 함수 export
// window.reinitFadeUp = initFadeUp;