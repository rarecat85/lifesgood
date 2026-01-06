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

  // 실제 섹션 매핑
  const sectionMap = new Map();
  const sections = document.querySelectorAll(
    ".kv, .wallgraphic, .booth-map, .culture, .techzone, .highlights"
  );

  sections.forEach((section, index) => {
    const sectionClass = section.className
      .split(" ")
      .find((cls) =>
        ["kv", "wallgraphic", "booth-map", "culture", "techzone", "highlights"].includes(cls)
      );
    if (sectionClass) {
      sectionMap.set(sectionClass, { element: section, index: index + 1 });
    }
  });

  // 각 버튼에 클릭 이벤트 리스너 추가
  footerNavLinks.forEach((button) => {
    button.addEventListener("click", () => {
      const sectionClass = button.getAttribute("data-section");
      const targetSection = sectionMap.get(sectionClass);

      if (targetSection) {
        // fullpage API가 존재하고 반응형 모드가 아닐 때
        if (typeof fullpage_api !== 'undefined' && !fullpage_api.test.isResponsive) {
          fullpage_api.moveTo(targetSection.index);
        } else {
          // 일반 스크롤
          targetSection.element.scrollIntoView({
            behavior: "smooth",
            block: "start",
          });
        }
      }
    });
  });
}

// Booth Swiper 인스턴스 및 상태 관리
let boothSlideSwiper = null;
let boothBreakpointState = null; // 'mobile', 'tablet', 'desktop'

function handleBoothSlide() {
  const boothSlide = document.querySelector(".booth-map .slide-bx");
  if (!boothSlide) return;

  // 각 슬라이드에 표시할 커스텀 텍스트 배열 (사용자가 원하는 대로 수정 가능)
  const boothSlideTexts = ["Hall", "Key<br>attractor", "LG Business<br>solutions", "K-Culture<br>shop", "Drive-<br class='pc-only'>thru", "Meeting<br>room", "Control<br>room", "E-Paper<br>display", "Learning<br>zone", "Hotel", "LED tech<br>zone"];

  // Swiper 초기화 함수
  function initBoothSwiper() {
    const currentWidth = window.innerWidth;
    let currentState = 'mobile';
    
    // 현재 화면 크기에 따른 상태 결정 (1281px 분기점만 체크)
    if (currentWidth >= 1281) {
      currentState = 'desktop';
    }
    
    // 상태가 변경되지 않았으면 재생성하지 않음
    if (boothBreakpointState === currentState && boothSlideSwiper) {
      // 페이드 인 (이미 페이드 아웃된 경우를 위해)
      boothSlide.classList.remove('is-transitioning');
      isTransitioning = false;
      return;
    }
    
    // 기존 Swiper가 있으면 재생성
    if (boothSlideSwiper) {
      const currentSlideIndex = boothSlideSwiper.realIndex;
      
      // transitionend 이벤트로 페이드 아웃 완료를 감지
      const handleTransitionEnd = (e) => {
        // opacity transition만 감지 (다른 transition 무시)
        if (e.propertyName !== 'opacity') return;
        
        // 이벤트 리스너 제거 (한 번만 실행)
        boothSlide.removeEventListener('transitionend', handleTransitionEnd);
        
        // 페이드 아웃 완료 후 Swiper destroy
        boothSlideSwiper.destroy(true, true);
        boothSlideSwiper = null;
        
        // DOM 정리 후 새 Swiper 생성
        setTimeout(() => {
          createSwiper(currentState, currentSlideIndex);
          
          // Swiper 생성 완료 후 페이드 인
          requestAnimationFrame(() => {
            boothSlide.classList.remove('is-transitioning');
            isTransitioning = false; // 전환 완료
          });
        }, 50);
      };
      
      // transitionend 이벤트 리스너 등록
      boothSlide.addEventListener('transitionend', handleTransitionEnd);
      
      // 만약 이미 페이드 아웃 상태가 아니라면 페이드 아웃 시작
      if (!boothSlide.classList.contains('is-transitioning')) {
        boothSlide.classList.add('is-transitioning');
        isTransitioning = true;
      }
    } else {
      // 초기 생성 시에는 바로 생성
      createSwiper(currentState, 0);
      isTransitioning = false;
    }
    
    boothBreakpointState = currentState;
  }
  
  // Swiper 생성 함수
  function createSwiper(state, initialSlide = 0) {
    let swiperConfig = {
      loop: true,
      speed: 500,
      initialSlide: initialSlide,
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
          // 초기 로드 시에도 첫 번째 bullet에 aria-current 설정
          setTimeout(() => {
            const initialActiveBullet = document.querySelector(
              ".booth-map .slide-bx .swiper-pagination-bullet-active"
            );
            if (initialActiveBullet) {
              initialActiveBullet.setAttribute("aria-current", "true");
            }
          }, 0);
        },
        slideChange: function() {
          if (this.pagination && this.pagination.el) {
            this.pagination.el.style.width = '';
          }
          // 슬라이드 변경 시 aria-current 속성 업데이트
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
        },
        resize: function() {
          if (this.pagination && this.pagination.el) {
            this.pagination.el.style.width = '';
          }
        }
      }
    };
    
    // 화면 크기에 따라 다른 설정 적용
    if (state === 'desktop') {
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
    } else {
      // 1281px 미만: 일반 슬라이드 (breakpoints로 768px 전환 처리)
      swiperConfig.slidesPerView = 3;
      swiperConfig.spaceBetween = 30;
      swiperConfig.breakpoints = {
        768: {
          slidesPerView: 3,
          spaceBetween: 8,
        }
      };
    }
    
    boothSlideSwiper = new Swiper(boothSlide, swiperConfig);
  }
  
  // 디바운스 함수
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
  
  // 분기점 체크 변수
  let lastCheckedState = null;
  let isTransitioning = false; // 전환 중 플래그
  
  // 리사이즈 핸들러 (디바운스 적용)
  const handleResizeDebounced = debounce(() => {
    initBoothSwiper();
    
    // pagination 재렌더링 (모바일/데스크탑 번호 형식 전환)
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
  }, 350); // 350ms 디바운스 (페이드 아웃 시간 고려)
  
  // 리사이즈 이벤트 핸들러 (즉시 페이드 아웃 + 디바운스된 재생성)
  const handleResize = () => {
    const currentWidth = window.innerWidth;
    let currentState = 'mobile';
    
    // 현재 화면 크기에 따른 상태 결정 (1281px 분기점만 체크)
    if (currentWidth >= 1281) {
      currentState = 'desktop';
    }
    
    // 상태가 변경되었을 때만 페이드 아웃 즉시 실행 (1281px 분기점에서만)
    if (lastCheckedState !== null && lastCheckedState !== currentState && !isTransitioning) {
      // 1281px 분기점을 넘어갈 때 즉시 페이드 아웃하여 일그러진 모습 숨김
      boothSlide.classList.add('is-transitioning');
      isTransitioning = true;
    }
    
    lastCheckedState = currentState;
    
    // 디바운스된 실제 재생성 함수 호출
    handleResizeDebounced();
  };
  
  // 초기화
  const initialWidth = window.innerWidth;
  if (initialWidth >= 1281) {
    lastCheckedState = 'desktop';
  } else {
    lastCheckedState = 'mobile';
  }
  initBoothSwiper();
  
  // 리사이즈 이벤트 리스너 등록
  window.addEventListener('resize', handleResize);
  
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
    autoplay:true,
    speed: 1000,
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
  const techzoneNewsSlide = document.querySelector(".techzone-list .news-slide .swiper");
  const techzoneNewsSwiper = new Swiper(techzoneNewsSlide, {
    slidesPerView: 1,
    spaceBetween: 10,
    speed: 1000,
    loop:true,
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
    }
  });
}

// Highlights Sub Swiper 인스턴스 및 상태 관리
let highlightsSubSwiper = null;
let highlightsBreakpointState = null; // 'mobile' or 'desktop'

function handleHighlightsSlide(){
  const highlightsMainSlide = document.querySelector(".highlights .main-slide .swiper");
  const highlightsSubSlide = document.querySelector(".highlights .sub-slide");
  
  // Main Swiper는 항상 초기화
  const highlightsMainSwiper = new Swiper(highlightsMainSlide, {
    loop:true,
    spaceBetween: 20,
    speed: 1000,
    navigation: {
      nextEl: ".highlights .main-slide .slide-next",
      prevEl: ".highlights .main-slide .slide-prev",
    },
    pagination: {
      el: ".highlights .main-slide .swiper-pagination",
      type: "fraction",
    }
  });
  
  // Sub Swiper 초기화 함수
  function initSubSwiper() {
    if (window.innerWidth > 768) {
      // 데스크톱: Sub Swiper 생성
      if (!highlightsSubSwiper) {
        highlightsSubSwiper = new Swiper(highlightsSubSlide, {
          loop:true,
          spaceBetween: 20,
          speed: 1000,
          navigation: {
            nextEl: ".highlights .sub-slide .slide-next",
            prevEl: ".highlights .sub-slide .slide-prev",
          },
          pagination: {
            el: ".highlights .sub-slide .swiper-pagination",
            type: "fraction",
          }
        });
      }
      highlightsBreakpointState = 'desktop';
    } else {
      // 모바일: Sub Swiper destroy
      highlightsBreakpointState = 'mobile';
    }
  }
  
  // Resize 이벤트에서 breakpoint 변경 감지
  function handleResize() {
    const isDesktop = window.innerWidth > 768;
    const newState = isDesktop ? 'desktop' : 'mobile';
    
    // 상태가 변경되었을 때만 처리
    if (newState !== highlightsBreakpointState) {
      if (newState === 'mobile' && highlightsSubSwiper) {
        // 데스크톱 → 모바일: Sub Swiper destroy
        highlightsSubSwiper.destroy(true, true);
        highlightsSubSwiper = null;
      } else if (newState === 'desktop' && !highlightsSubSwiper) {
        // 모바일 → 데스크톱: Sub Swiper 재생성
        highlightsSubSwiper = new Swiper(highlightsSubSlide, {
          loop:true,
          spaceBetween: 20,
          speed: 1000,
          navigation: {
            nextEl: ".highlights .sub-slide .slide-next",
            prevEl: ".highlights .sub-slide .slide-prev",
          },
          pagination: {
            el: ".highlights .sub-slide .swiper-pagination",
            type: "fraction",
          }
        });
      }
      highlightsBreakpointState = newState;
    }
  }
  
  // Resize 이벤트 리스너 등록
  window.addEventListener('resize', handleResize);
  
  // 초기화 실행
  initSubSwiper();
}

/* Layer Popup 데이터 구조 */
const layerPopupData = [
  {
    title: "Key Attractor",
    subtitle: "(Brand Facade)",
    description: "Experience a tower-style display powered by fine-pitch LED and T-Mesh—where media art meets premium advertising.",
    defaultBg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_1.png",
    productList: [
      { name: "Indoor LED", code: "LSCC012", link: "https://www.lg-informationdisplay.com/product/led-signage/indoor-led/LSCC012", image: "/theme/rbFront/img/w/ise/ise2026/product_img_1_1.png" },
      { name: "Transparent Mesh LED", code: "LTPA062", link: "/products/fine-pitch-led", image: "/theme/rbFront/img/w/ise/ise2026/product_img_1_2.png" }
    ],
    mediaGallery: [
      { type: 'youtube', youtubeUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', thumbnail: '/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_1.png', title: 'Key Attractor Video' },
      { type: 'image', imageUrl: '/theme/rbFront/img/w/ise/ise2026/product_img_1_1.png', title: 'Gallery Image 1' },
      { type: 'image', imageUrl: '/theme/rbFront/img/w/ise/ise2026/product_img_1_2.png', title: 'Gallery Image 2' },
      { type: 'image', imageUrl: '/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_1.png', title: 'Gallery Image 3' }
    ]
  },
  {
    title: "LG Business cloud & solutions",
    subtitle: "",
    description: "Experience customized cloud solutions designed for every business area!",
    defaultBg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_2.png",
    tablist: [
      { name: "LG Connected Care", id: "tab-2-1", bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_2_tab1.png", title: "Display remote management solution", description: "It is important to have a device control solution that manages signage across multiple stores.", productList: [
        { name: "Connected Care Display", code: "CC-001", link: "/products/connected-care", image: "/theme/rbFront/img/w/ise/ise2026/product_img_2_1.png" }
      ]},
      { name: "LG SuperSign Cloud", id: "tab-2-2", bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_2_tab2.png", title: "Cloud-Based Content Management Solution", description: "We're looking for a way to deliver a seamless omnichannel experience that strengthens customer relationships and drives growth through personalized offers.", productList: [
        { name: "SuperSign Cloud", code: "SSC-001", link: "/products/supersign-cloud", image: "/theme/rbFront/img/w/ise/ise2026/product_img_2_2.png" }
      ]},
      { name: "LG DOOH Ads", id: "tab-2-3", bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_2_tab2.png", title: "Signage Display Advertising Platform", description: "We operate stores in high-traffic areas,so launching an ad business for additional revenue would be a great opportunity.", productList: [
        { name: "DOOH Ads Platform", code: "DA-001", link: "/products/dooh-ads", image: "/theme/rbFront/img/w/ise/ise2026/product_img_2_1.png" }
      ]},
      { name: "LG SoundCast", id: "tab-2-4", bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_2_tab2.png", title: "Signage Display Advertising Platform", description: "We need a solution that would allow us to control the multiple in-store screens across our global retail locations so customers could enjoy the cute Palm Pals video content exactly the way we envision it.", productList: [
        { name: "SoundCast System", code: "SC-001", link: "/products/soundcast", image: "/theme/rbFront/img/w/ise/ise2026/product_img_2_2.png" }
      ]},
      { name: "LG All-In-One LED", id: "tab-2-5", bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_2_tab2.png", title: "Experience the convenience of LG's LED All-in-One LAPA series", description: "This all-in-one package includes an embedded controller and built-in speaker, making setup a breeze.", productList: [
        { name: "All-In-One LED", code: "AIO-001", link: "/products/all-in-one-led", image: "/theme/rbFront/img/w/ise/ise2026/product_img_2_1.png" }
      ]}
    ],
    mediaGallery: [
      { type: 'youtube', youtubeUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', thumbnail: '/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_2.png', title: 'LG Business Cloud Video' },
      { type: 'image', imageUrl: '/theme/rbFront/img/w/ise/ise2026/product_img_2_1.png', title: 'Gallery Image 1' },
      { type: 'image', imageUrl: '/theme/rbFront/img/w/ise/ise2026/product_img_2_2.png', title: 'Gallery Image 2' },
      { type: 'image', imageUrl: '/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_2_tab1.png', title: 'Gallery Image 3' }
    ]
  },
  {
    title: "K-Culture shop",
    subtitle: "",
    description: "Experience a tower-style display powered by fine-pitch LED and T-Mesh—where media art meets premium advertising.",
    defaultBg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_3.png",
    tablist: [
      { name: "LG Connected Care", id: "tab-3-1", bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_3_tab1.png", title: "Display remote management solution", description: "It is important to have a device control solution that manages signage across multiple stores.", productList: [
        { type: "solution", name: "LG ConnectedCare (Display remote solution)", bgClass: "bg-light-blue", link: "https://www.lg-informationdisplay.com/software-solutions/lg-business-cloud/lg-connectedcare", image: "/theme/rbFront/img/w/ise/ise2026/product_img_3_1_1.png" },
        { type: "product", name: "K-Culture Connected Care", code: "KC-CC-001", link: "https://www.lg-informationdisplay.com/product/oled-signage/transparent-oled/55EW5P-M", image: "/theme/rbFront/img/w/ise/ise2026/product_img_3_1_2.png" }
      ]},
      { name: "LG SuperSign Cloud", id: "tab-3-2", bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_3_tab2.png", title: "Cloud-Based Content Management Solution", description: "We're looking for a way to deliver a seamless omnichannel experience that strengthens customer relationships and drives growth through personalized offers.", productList: [
        { type: "solution", name: "LG SuperSign Cloud (Signage content solution)", bgClass: "bg-light-blue", link: "https://www.lg-informationdisplay.com/software-solutions/lg-business-cloud/lg-supersign-cloud", image: "/theme/rbFront/img/w/ise/ise2026/product_img_3_2_1.png" },
        { type: "product", name: "4K UHD Signage", code: "65UH5Q-E", link: "https://www.lg-informationdisplay.com/product/digital-signage/standard/65UH5Q", image: "/theme/rbFront/img/w/ise/ise2026/product_img_3_2_2.png" },
        { type: "product", name: "Stretch Signage", code: "37BH7N", link: "https://www.lg-informationdisplay.com/product/digital-signage/special/37BH7N", image: "/theme/rbFront/img/w/ise/ise2026/product_img_3_2_3.png" },
        { type: "product", name: "Transparent OLED Signage", code: "55EW5P-M", link: "https://www.lg-informationdisplay.com/product/oled-signage/transparent-oled/55EW5P-M", image: "/theme/rbFront/img/w/ise/ise2026/product_img_3_2_4.png" }
      ]},
      { name: "LG DOOH Ads", id: "tab-3-3", bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_3_tab2.png", title: "Signage Display Advertising Platform", description: "We operate stores in high-traffic areas,so launching an ad business for additional revenue would be a great opportunity.", productList: [
        { type: "product", name: "K-Culture DOOH", code: "KC-DA-001", link: "/products/k-culture-dooh", image: "/theme/rbFront/img/w/ise/ise2026/product_img_3_1.png" }
      ]},
      { name: "LG SoundCast", id: "tab-3-4", bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_3_tab2.png", title: "Signage Display Advertising Platform", description: "We need a solution that would allow us to control the multiple in-store screens across our global retail locations so customers could enjoy the cute Palm Pals video content exactly the way we envision it.", productList: [
        { type: "product", name: "K-Culture SoundCast", code: "KC-SC-001", link: "/products/k-culture-sc", image: "/theme/rbFront/img/w/ise/ise2026/product_img_3_1.png" }
      ]},
      { name: "LG All-In-One LED", id: "tab-3-5", bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_3_tab2.png", title: "Experience the convenience of LG's LED All-in-One LAPA series", description: "This all-in-one package includes an embedded controller and built-in speaker, making setup a breeze.", productList: [
        { type: "product", name: "K-Culture All-In-One LED", code: "KC-AIO-001", link: "/products/k-culture-aio", image: "/theme/rbFront/img/w/ise/ise2026/product_img_3_1.png" }
      ]}
    ],
    productList: [],
    mediaGallery: [
      { type: 'youtube', youtubeUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', thumbnail: '/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_3.png', title: 'K-Culture Overview Video' },
      { type: 'image', imageUrl: '/theme/rbFront/img/w/ise/ise2026/product_img_3_1_1.png', title: 'Gallery Image 1' },
      { type: 'image', imageUrl: '/theme/rbFront/img/w/ise/ise2026/product_img_3_1_2.png', title: 'Gallery Image 2' },
      { type: 'image', imageUrl: '/theme/rbFront/img/w/ise/ise2026/product_img_3_2_1.png', title: 'Gallery Image 3' },
      { type: 'image', imageUrl: '/theme/rbFront/img/w/ise/ise2026/product_img_3_2_2.png', title: 'Gallery Image 4' }
    ]
  },
  {
    title: "Drive-thru",
    subtitle: "",
    description: "Experience a tower-style display powered by fine-pitch LED and T-Mesh—where media art meets premium advertising.",
    defaultBg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_4.png",
    tablist: [
      { name: "Overview", id: "tab-4-1", bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_4_tab1.png", title: "Drive-thru Solutions", description: "Innovative display solutions for drive-thru experiences" },
      { name: "Technology", id: "tab-4-2", bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_4_tab2.png", title: "Advanced Technology", description: "Cutting-edge technology powering drive-thru displays" }
    ],
    productList: [
      { type: "product", name: "Drive-thru Display", code: "DT-001", link: "/products/drive-thru", image: "/theme/rbFront/img/w/ise/ise2026/product_img_4_1.png" }
    ],
    mediaGallery: [
      { type: 'youtube', youtubeUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', thumbnail: '/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_4.png', title: 'Drive-thru Video' },
      { type: 'image', imageUrl: '/theme/rbFront/img/w/ise/ise2026/product_img_4_1.png', title: 'Gallery Image 1' },
      { type: 'image', imageUrl: '/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_4_tab1.png', title: 'Gallery Image 2' },
      { type: 'image', imageUrl: '/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_4_tab2.png', title: 'Gallery Image 3' }
    ]
  },
  {
    title: "Meeting room",
    subtitle: "",
    description: "Experience a tower-style display powered by fine-pitch LED and T-Mesh—where media art meets premium advertising.",
    defaultBg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_5.png",
    tablist: [
      { name: "Overview", id: "tab-5-1", bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_5_tab1.png", title: "Meeting Room Solutions", description: "Transform your meeting spaces with intelligent displays" },
      { name: "Features", id: "tab-5-2", bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_5_tab2.png", title: "Key Features", description: "Explore collaboration features for modern meeting rooms" }
    ],
    productList: [
      { type: "product", name: "Meeting Display", code: "MD-001", link: "/products/meeting-display", image: "/theme/rbFront/img/w/ise/ise2026/product_img_5_1.png" },
      { type: "product", name: "Interactive Board", code: "IB-001", link: "/products/interactive-board", image: "/theme/rbFront/img/w/ise/ise2026/product_img_5_2.png" }
    ],
    mediaGallery: [
      { type: 'youtube', youtubeUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', thumbnail: '/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_5.png', title: 'Meeting Room Video' },
      { type: 'image', imageUrl: '/theme/rbFront/img/w/ise/ise2026/product_img_5_1.png', title: 'Gallery Image 1' },
      { type: 'image', imageUrl: '/theme/rbFront/img/w/ise/ise2026/product_img_5_2.png', title: 'Gallery Image 2' },
      { type: 'image', imageUrl: '/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_5_tab1.png', title: 'Gallery Image 3' }
    ]
  },
  {
    title: "Control room",
    subtitle: "",
    description: "Experience a tower-style display powered by fine-pitch LED and T-Mesh—where media art meets premium advertising.",
    defaultBg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_6.png",
    tablist: [
      { name: "Overview", id: "tab-6-1", bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_6_tab1.png", title: "Control Room Solutions", description: "Professional displays for mission-critical environments" },
      { name: "Solutions", id: "tab-6-2", bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_6_tab2.png", title: "Integrated Solutions", description: "Complete control room display management systems" }
    ],
    productList: [
      { name: "Control Display", code: "CD-001", link: "/products/control-display", image: "/theme/rbFront/img/w/ise/ise2026/product_img_6_1.png" }
    ],
    mediaGallery: [
      { type: 'youtube', youtubeUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', thumbnail: '/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_6.png', title: 'Control Room Video' },
      { type: 'image', imageUrl: '/theme/rbFront/img/w/ise/ise2026/product_img_6_1.png', title: 'Gallery Image 1' },
      { type: 'image', imageUrl: '/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_6_tab1.png', title: 'Gallery Image 2' },
      { type: 'image', imageUrl: '/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_6_tab2.png', title: 'Gallery Image 3' }
    ]
  },
  {
    title: "E-Paper display",
    subtitle: "",
    description: "Experience a tower-style display powered by fine-pitch LED and T-Mesh—where media art meets premium advertising.",
    defaultBg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_7.png",
    tablist: [
      { name: "Overview", id: "tab-7-1", bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_7_tab1.png", title: "E-Paper Display", description: "Energy-efficient digital signage solutions" },
      { name: "Technology", id: "tab-7-2", bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_7_tab2.png", title: "E-Paper Technology", description: "Advanced e-paper technology for sustainable displays" }
    ],
    productList: [
      { name: "E-Paper Display", code: "EP-001", link: "/products/e-paper", image: "/theme/rbFront/img/w/ise/ise2026/product_img_7_1.png" }
    ],
    mediaGallery: [
      { type: 'youtube', youtubeUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', thumbnail: '/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_7.png', title: 'E-Paper Video' },
      { type: 'image', imageUrl: '/theme/rbFront/img/w/ise/ise2026/product_img_7_1.png', title: 'Gallery Image 1' },
      { type: 'image', imageUrl: '/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_7_tab1.png', title: 'Gallery Image 2' },
      { type: 'image', imageUrl: '/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_7_tab2.png', title: 'Gallery Image 3' }
    ]
  },
  {
    title: "Learning zone",
    subtitle: "",
    description: "Experience a tower-style display powered by fine-pitch LED and T-Mesh—where media art meets premium advertising.",
    defaultBg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_8.png",
    tablist: [
      { name: "Overview", id: "tab-8-1", bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_8_tab1.png", title: "Learning Zone Overview", description: "Interactive displays for modern education environments" },
      { name: "Educational Solutions", id: "tab-8-2", bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_8_tab2.png", title: "Educational Solutions", description: "Comprehensive solutions for smart classrooms" }
    ],
    productList: [
      { name: "Learning Display", code: "LD-001", link: "/products/learning-display", image: "/theme/rbFront/img/w/ise/ise2026/product_img_8_1.png" },
      { name: "Interactive Whiteboard", code: "IW-001", link: "/products/interactive-whiteboard", image: "/theme/rbFront/img/w/ise/ise2026/product_img_8_2.png" }
    ],
    mediaGallery: [
      { type: 'youtube', youtubeUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', thumbnail: '/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_8.png', title: 'Learning Zone Video' },
      { type: 'image', imageUrl: '/theme/rbFront/img/w/ise/ise2026/product_img_8_1.png', title: 'Gallery Image 1' },
      { type: 'image', imageUrl: '/theme/rbFront/img/w/ise/ise2026/product_img_8_2.png', title: 'Gallery Image 2' },
      { type: 'image', imageUrl: '/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_8_tab1.png', title: 'Gallery Image 3' }
    ]
  },
  {
    title: "Hotel zone",
    subtitle: "",
    description: "Experience a tower-style display powered by fine-pitch LED and T-Mesh—where media art meets premium advertising.",
    defaultBg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_9.png",
    tablist: [
      { name: "Overview", id: "tab-9-1", bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_9_tab1.png", title: "Hotel Zone Overview", description: "Premium display solutions for hospitality industry" },
      { name: "Hospitality Solutions", id: "tab-9-2", bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_9_tab2.png", title: "Hospitality Solutions", description: "Tailored displays for hotels and guest experiences" }
    ],
    productList: [
      { name: "Hotel Display", code: "HD-001", link: "/products/hotel-display", image: "/theme/rbFront/img/w/ise/ise2026/product_img_9_1.png" }
    ],
    mediaGallery: [
      { type: 'youtube', youtubeUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', thumbnail: '/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_9.png', title: 'Hotel Zone Video' },
      { type: 'image', imageUrl: '/theme/rbFront/img/w/ise/ise2026/product_img_9_1.png', title: 'Gallery Image 1' },
      { type: 'image', imageUrl: '/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_9_tab1.png', title: 'Gallery Image 2' },
      { type: 'image', imageUrl: '/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_9_tab2.png', title: 'Gallery Image 3' }
    ]
  },
  {
    title: "LED tech zone",
    subtitle: "",
    description: "Experience a tower-style display powered by fine-pitch LED and T-Mesh—where media art meets premium advertising.",
    defaultBg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_10.png",
    tablist: [
      { name: "Overview", id: "tab-10-1", bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_10_tab1.png", title: "LED Tech Zone", description: "Next-generation LED display technology showcase" },
      { name: "LED Technology", id: "tab-10-2", bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_10_tab2.png", title: "LED Technology", description: "Innovative LED solutions for various applications" },
      { name: "Applications", id: "tab-10-3", bg: "/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_10_tab3.png", title: "Applications", description: "Real-world applications of LED display technology" }
    ],
    productList: [
      { name: "LED Display Pro", code: "LED-PRO-001", link: "/products/led-pro", image: "/theme/rbFront/img/w/ise/ise2026/product_img_10_1.png" },
      { name: "LED Display Ultra", code: "LED-ULTRA-001", link: "/products/led-ultra", image: "/theme/rbFront/img/w/ise/ise2026/product_img_10_2.png" }
    ],
    mediaGallery: [
      { type: 'youtube', youtubeUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', thumbnail: '/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_10.png', title: 'LED Tech Zone Video' },
      { type: 'image', imageUrl: '/theme/rbFront/img/w/ise/ise2026/product_img_10_1.png', title: 'Gallery Image 1' },
      { type: 'image', imageUrl: '/theme/rbFront/img/w/ise/ise2026/product_img_10_2.png', title: 'Gallery Image 2' },
      { type: 'image', imageUrl: '/theme/rbFront/img/w/ise/ise2026/booth_layer_bg_10_tab1.png', title: 'Gallery Image 3' }
    ]
  }
];

/* Layer Popup 컨텐츠 렌더링 */
function renderLayerContent(index) {
  const layerContent = document.querySelector(".layer-content");
  if (!layerContent || index < 0 || index >= layerPopupData.length) return;
  
  const data = layerPopupData[index];
  
  // tablist 유무 확인
  const hasTablist = data.tablist && data.tablist.length > 0;
  
  // Tablist HTML 생성 (모든 탭 비활성 상태로 시작)
  const tablistHTML = hasTablist ? `
    <ul class="layer-sub-tabs" role="tablist">
      ${data.tablist.map((tab, idx) => `
        <li role="presentation">
          <button 
            role="tab" 
            id="${tab.id}" 
            aria-selected="false"
            class="layer-tab-btn"
            data-bg="${tab.bg || ''}"
            data-title="${tab.title || ''}"
            data-description="${tab.description || ''}"
          >
            ${tab.name}
          </button>
          <div class="tab-detail">
            <div class="tab-detail-title-wrap">
              <span class="tab-detail-subtitle">${tab.name}</span>
              <h4 class="tab-detail-title">${tab.title || ''}</h4>
            </div>
            <p class="tab-detail-desc">${tab.description || ''}</p>
          </div>
        </li>
      `).join('')}
    </ul>
  ` : '';
  
  // 탭의 배경 이미지들을 미리 로드 (깜빡임 방지)
  if (hasTablist) {
    data.tablist.forEach(tab => {
      if (tab.bg) {
        const img = new Image();
        img.src = tab.bg;
      }
    });
  }
  
  // Product List HTML 생성
  let productListHTML = '';
  
  if (hasTablist && data.tablist) {
    // tablist가 있을 때: 탭별로 개별 생성
    productListHTML = data.tablist.map((tab, tabIdx) => {
      if (!tab.productList || tab.productList.length === 0) return '';
      
      return `
        <div class="layer-product-list has-tabs closed" data-tab-id="${tab.id}">
          <button type="button" class="close-product-btn">menu</button>
          <h4 class="product-list-title">${tab.name}</h4>
          <div class="product-slider">
            <div class="swiper">
              <div class="swiper-wrapper">
                ${tab.productList.map((product, idx) => {
                  const isSolution = product.type === 'solution';
                  const isProduct = product.type === 'product';
                  
                  // product 유형만 필터링하여 인덱스 계산
                  const productItems = tab.productList.filter(p => p.type === 'product');
                  const productIndex = productItems.indexOf(product);
                  const label = isProduct && productIndex >= 0 ? String.fromCharCode(97 + productIndex) : '';
                  const bgClass = isSolution && product.bgClass ? product.bgClass : '';
                  
                  return `
                    <div class="swiper-slide">
                      <a href="${product.link}" class="product-item ${bgClass}" target="_blank" rel="noopener noreferrer">
                        ${product.image ? `
                          <div class="product-img-wrapper">
                            <img src="${product.image}" alt="${product.name}" class="product-img" loading="lazy">
                            ${isProduct && label ? `<span class="product-label">${label}</span>` : ''}
                          </div>
                        ` : ''}
                        <div class="product-info">
                          <span class="product-name">${product.name}</span>
                          ${product.code ? `<span class="product-code">${product.code}</span>` : ''}
                        </div>
                        <button class="accordion-toggle" aria-label="Toggle details" aria-expanded="false">
                          <span class="icon"></span>
                        </button>
                      </a>
                    </div>
                  `;
                }).join('')}
              </div>
            </div>
            <div class="slide-prev"></div>
            <div class="slide-next"></div>
          </div>
        </div>
      `;
    }).join('');
  } else if (data.productList && data.productList.length > 0) {
    // tablist가 없을 때: 최상위 productList 사용
    productListHTML = `
      <div class="layer-product-list no-tabs">
        <div class="product-slider">
          <div class="swiper">
            <div class="swiper-wrapper">
              ${data.productList.map((product, idx) => {
                const isSolution = product.type === 'solution';
                const isProduct = product.type === 'product';
                
                // product 유형만 필터링하여 인덱스 계산
                const productItems = data.productList.filter(p => p.type === 'product');
                const productIndex = productItems.indexOf(product);
                const label = isProduct && productIndex >= 0 ? String.fromCharCode(97 + productIndex) : '';
                const bgClass = isSolution && product.bgClass ? product.bgClass : '';
                
                return `
                  <div class="swiper-slide">
                    <a href="${product.link}" class="product-item ${bgClass}" target="_blank" rel="noopener noreferrer">
                      ${product.image ? `
                        <div class="product-img-wrapper">
                          <img src="${product.image}" alt="${product.name}" class="product-img" loading="lazy">
                          ${isProduct && label ? `<span class="product-label">${label}</span>` : ''}
                        </div>
                      ` : ''}
                      <div class="product-info">
                        <span class="product-name">${product.name}</span>
                        ${product.code ? `<span class="product-code">${product.code}</span>` : ''}
                      </div>
                      <button class="accordion-toggle" aria-label="Toggle details" aria-expanded="false">
                        <span class="icon"></span>
                      </button>
                    </a>
                  </div>
                `;
              }).join('')}
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
      <div class="layer-content-title-wrap">
        <h3 class="layer-content-title">
          <span>${index + 1}.&nbsp;</span>${data.title}<button type="button" class="home-btn">Home</button>
        </h3>
        <img src="/theme/rbFront/img/m/ise/ise2026/booth_location_${index + 1}.png" alt="${data.title} location" class="booth-location">
      </div>
      ${tablistHTML}
      ${productListHTML}
    </div>
  `;
  
  // video-layer 보존하기 위해 임시 저장
  const videoLayer = layerContent.querySelector('.video-layer');
  
  // innerHTML 설정
  layerContent.innerHTML = contentHTML;
  
  // video-layer가 있었다면 다시 추가
  if (videoLayer) {
    layerContent.appendChild(videoLayer);
  }
  
  // innerHTML 설정 후 배경 이미지 설정 (defaultBg)
  layerContent.style.backgroundImage = `url('${data.defaultBg}')`;
  layerContent.setAttribute('data-default-bg', data.defaultBg); // defaultBg 저장 (home-btn 클릭 시 복원용)
  layerContent.classList.remove('active'); // 초기 상태: 비활성화
  layerContent.classList.remove('has-active-subtab'); // 초기 상태에서는 home-btn 숨김
  
  // tablist 유무에 따라 조건부 클래스 추가
  layerContent.classList.remove('has-tablist', 'no-tablist');
  if (hasTablist) {
    layerContent.classList.add('has-tablist');
  } else {
    layerContent.classList.add('no-tablist');
  }
}

/* Layer Popup 열기 */
function openLayerPopup(index) {
  const layerPop = document.querySelector(".layer-pop");
  const layerTabItems = document.querySelectorAll(".layer-tab-item");
  
  if (!layerPop) return;
  
  // 레이어 팝업 활성화
  layerPop.classList.add("active");
  
  // 모든 탭의 active 클래스 제거
  layerTabItems.forEach(item => item.classList.remove("active"));
  
  // 해당 index의 탭 활성화
  if (layerTabItems[index]) {
    layerTabItems[index].classList.add("active");
  }
  
  // 컨텐츠 렌더링
  renderLayerContent(index);
  
  // 컨텐츠 렌더링 후 Swiper 초기화
  setTimeout(() => {
    initProductSwiper();
  }, 100);
  
  // body scroll 방지 (선택사항)
  document.body.style.overflow = "hidden";
}

/* Layer Popup 닫기 */
function closeLayerPopup() {
  const layerPop = document.querySelector(".layer-pop");
  const layerTabItems = document.querySelectorAll(".layer-tab-item");
  
  if (!layerPop) return;
  
  // video-layer도 함께 닫기
  closeVideoLayer();
  
  // 레이어 팝업 비활성화
  layerPop.classList.remove("active");
  
  // 모든 탭의 active 클래스 제거
  layerTabItems.forEach(item => item.classList.remove("active"));
  
  // body scroll 복원
  document.body.style.overflow = "";
}

/* Video Layer (Photos Gallery) 관리 */
let mainGallerySwiper = null;
let thumbGallerySwiper = null;

/* Video Layer 열기 */
function openVideoLayer(index) {
  const videoLayer = document.querySelector(".video-layer");
  const data = layerPopupData[index];
  
  if (!videoLayer || !data.mediaGallery) return;
  
  // 갤러리 렌더링
  renderMediaGallery(data.mediaGallery);
  
  // 오버레이 표시
  videoLayer.classList.add("active");
  
  // Swiper Thumbs 초기화
  setTimeout(() => {
    initMediaGallerySwiper();
  }, 100);
}

/* Video Layer 닫기 */
function closeVideoLayer() {
  const videoLayer = document.querySelector(".video-layer");
  if (!videoLayer) return;
  
  videoLayer.classList.remove("active");
  
  // Swiper 인스턴스 제거
  if (mainGallerySwiper) {
    mainGallerySwiper.destroy();
    mainGallerySwiper = null;
  }
  if (thumbGallerySwiper) {
    thumbGallerySwiper.destroy();
    thumbGallerySwiper = null;
  }
}

/* 미디어 갤러리 렌더링 */
function renderMediaGallery(mediaGallery) {
  const mainWrapper = document.querySelector(".main-gallery-swiper .swiper-wrapper");
  const thumbWrapper = document.querySelector(".thumb-gallery-swiper .swiper-wrapper");
  
  if (!mainWrapper || !thumbWrapper) return;
  
  // 메인 슬라이드 생성
  const mainSlides = mediaGallery.map((item) => {
    if (item.type === 'youtube') {
      return `
        <div class="swiper-slide">
          <a href="${item.youtubeUrl}" target="_blank" rel="noopener noreferrer" class="youtube-link">
            <img src="${item.thumbnail}" alt="${item.title}">
            <div class="play-icon"></div>
          </a>
        </div>
      `;
    } else {
      return `
        <div class="swiper-slide">
          <img src="${item.imageUrl}" alt="${item.title}">
        </div>
      `;
    }
  }).join('');
  
  // 썸네일 슬라이드 생성
  const thumbSlides = mediaGallery.map((item) => {
    const thumbUrl = item.type === 'youtube' ? item.thumbnail : item.imageUrl;
    const iconClass = item.type === 'youtube' ? 'has-play-icon' : '';
    return `
      <div class="swiper-slide ${iconClass}">
        <img src="${thumbUrl}" alt="${item.title}">
      </div>
    `;
  }).join('');
  
  mainWrapper.innerHTML = mainSlides;
  thumbWrapper.innerHTML = thumbSlides;
}

/* 미디어 갤러리 Swiper 초기화 */
function initMediaGallerySwiper() {
  // 기존 인스턴스 제거
  if (mainGallerySwiper) mainGallerySwiper.destroy();
  if (thumbGallerySwiper) thumbGallerySwiper.destroy();
  
  // Thumbs Swiper 먼저 초기화
  thumbGallerySwiper = new Swiper(".thumb-gallery-swiper", {
    slidesPerView: 4,
    spaceBetween: 10,
    watchSlidesProgress: true,
    direction: 'vertical',
    navigation: {
      nextEl: ".thumb-slide-next",
      prevEl: ".thumb-slide-prev",
    },
  });
  
  // Main Swiper 초기화 (thumbs 연결)
  mainGallerySwiper = new Swiper(".main-gallery-swiper", {
    slidesPerView: 1,
    spaceBetween: 0,
    thumbs: {
      swiper: thumbGallerySwiper,
    },
  });
}

/* Product Swiper 인스턴스 관리 */
let productSwiperInstances = new Map();

/* Product Swiper 초기화 */
function initProductSwiper() {
  const productSliders = document.querySelectorAll(".layer-product-list .product-slider .swiper");

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
      loop: slideCount > 3,
      navigation: {
        nextEl: nextBtn,
        prevEl: prevBtn,
      },
      breakpoints: {
        768: {
          slidesPerView: 3,
          spaceBetween: 8,
        }
      }
    });
    
    productSwiperInstances.set(slider, swiper);
    
    // PC에서 슬라이드가 3개 이하면 네비게이션 버튼 숨김
    if (slideCount <= 3) {
      if (nextBtn) nextBtn.style.display = 'none';
      if (prevBtn) prevBtn.style.display = 'none';
    }
  });
}

/* Product 아코디언 토글 처리 */
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

/* Layer Popup 이벤트 핸들러 초기화 */
function handleLayerPopup() {
  // 1. Learn more 버튼 클릭 이벤트
  const learnMoreButtons = document.querySelectorAll(".booth-map .booth-bx .btn");
  
  learnMoreButtons.forEach((button) => {
    button.addEventListener("click", () => {
      // 부모 슬라이드의 index 찾기
      const swiperSlide = button.closest(".swiper-slide");
      if (!swiperSlide) return;
      
      // boothSlideSwiper가 있으면 realIndex 사용
      if (boothSlideSwiper) {
        const slides = Array.from(boothSlideSwiper.slides);
        const slideIndex = slides.indexOf(swiperSlide);
        
        // slideIndex가 1~10이므로 0~9로 변환 (0번 슬라이드는 Hall 맵이므로 제외)
        const layerIndex = slideIndex - 1;
        
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
    photoBtn.addEventListener("click", () => {
      const videoLayer = document.querySelector(".video-layer");
      
      // video-layer가 이미 열려있으면 닫기
      if (videoLayer && videoLayer.classList.contains("active")) {
        closeVideoLayer();
      } else {
        // 닫혀있으면 열기
        const layerTabItems = document.querySelectorAll(".layer-tab-item");
        const activeTabItem = document.querySelector(".layer-tab-item.active");
        const activeIndex = Array.from(layerTabItems).indexOf(activeTabItem);
        
        if (activeIndex >= 0 && activeIndex < layerPopupData.length) {
          openVideoLayer(activeIndex);
        }
      }
    });
  }
  
  // 2-2. Video Layer 닫기 버튼 클릭 이벤트
  const videoCloseBtn = document.querySelector(".video-close-btn");
  if (videoCloseBtn) {
    videoCloseBtn.addEventListener("click", closeVideoLayer);
  }
  
  // 3. 레이어 탭 버튼 클릭 이벤트 (외부 탭: layer-tab-item)
  const layerTabButtons = document.querySelectorAll(".layer-nav-tabs .layer-tab-btn");
  
  layerTabButtons.forEach((button, index) => {
    button.addEventListener("click", () => {
      const layerTabItems = document.querySelectorAll(".layer-tab-item");
      const layerContent = document.querySelector(".layer-content");
      
      // 탭 변경 시 video-layer 닫기
      closeVideoLayer();
      
      // 모든 탭의 active 클래스 제거
      layerTabItems.forEach(item => item.classList.remove("active"));
      
      // 클릭한 탭 활성화
      if (layerTabItems[index]) {
        layerTabItems[index].classList.add("active");
      }
      
      // fade 효과와 함께 컨텐츠 렌더링
      if (layerContent) {
        layerContent.style.opacity = '0';
        layerContent.style.transform = 'translateY(-10px)';
        
        setTimeout(() => {
          renderLayerContent(index);
          layerContent.style.opacity = '1';
          layerContent.style.transform = 'translateY(0)';
          
          // home-btn 숨김 (renderLayerContent에서도 제거하지만 명시적으로 추가)
          layerContent.classList.remove('has-active-subtab');
          
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
        const allSubTabs = layerContent.querySelectorAll(".layer-sub-tabs .layer-tab-btn");
        allSubTabs.forEach(tab => {
          tab.classList.remove("active");
          tab.setAttribute("aria-selected", "false");
        });
        
        // 모든 tab-detail 숨기기
        const allTabDetails = layerContent.querySelectorAll(".tab-detail");
        allTabDetails.forEach(detail => detail.classList.remove("active"));
        
        // 배경 이미지를 defaultBg로 복원
        const defaultBg = layerContent.getAttribute("data-default-bg");
        if (defaultBg) {
          layerContent.style.backgroundImage = `url('${defaultBg}')`;
        }
        
        // 모든 product-list 숨김
        const allProductLists = layerContent.querySelectorAll(".layer-product-list");
        allProductLists.forEach(list => list.classList.add('closed'));
        
        // layer-content-title에서 active 클래스 제거
        const contentTitle = layerContent.querySelector(".layer-content-title");
        if (contentTitle) {
          contentTitle.classList.remove("active");
        }
        
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
      
      // 이미 활성화된 탭이면 아무 작업도 하지 않음
      if (clickedTab.classList.contains("active")) return;
      
      // 같은 tablist 내의 모든 탭 찾기
      const tablist = clickedTab.closest(".layer-sub-tabs");
      if (!tablist) return;
      
      const allTabs = tablist.querySelectorAll(".layer-tab-btn");
      
      // 모든 탭의 active 상태 제거
      allTabs.forEach(tab => {
        tab.classList.remove("active");
        tab.setAttribute("aria-selected", "false");
      });
      
      // 클릭한 탭 활성화
      clickedTab.classList.add("active");
      clickedTab.setAttribute("aria-selected", "true");
      
      // 모든 tab-detail 숨기기
      const allTabDetails = tablist.querySelectorAll(".tab-detail");
      allTabDetails.forEach(detail => detail.classList.remove("active"));
      
      // 클릭한 탭의 tab-detail 표시
      const clickedTabDetail = clickedTab.parentElement.querySelector(".tab-detail");
      if (clickedTabDetail) {
        clickedTabDetail.classList.add("active");
      }
      
      // layer-content에 active 클래스 추가
      layerContent.classList.add("active");
      
      // home-btn 표시를 위한 클래스 추가
      layerContent.classList.add("has-active-subtab");
      
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
      
      // 배경 이미지를 탭의 bg로 즉시 변경 (fade 효과 없음)
      const tabBg = clickedTab.getAttribute("data-bg");
      if (tabBg) {
        layerContent.style.backgroundImage = `url('${tabBg}')`;
      }
      
      // 모든 product-list 숨김
      const allProductLists = layerContent.querySelectorAll(".layer-product-list");
      allProductLists.forEach(list => list.classList.add('closed'));
      
      // 클릭한 탭의 product-list 표시
      const targetProductList = layerContent.querySelector(`[data-tab-id="${clickedTab.id}"]`);
      if (targetProductList) {
        targetProductList.classList.remove('closed');
        
        // Swiper 재초기화
        setTimeout(() => {
          initProductSwiper();
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
  handleHighlightsSlide();
  handleLayerPopup();

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
    normalScrollElements: ".layer-pop, .layer-pop *",
    responsiveWidth: 1281, // 1081px 이하에서 fullpage 해제
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