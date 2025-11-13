/**
 * fade-up 애니메이션 초기화
 * .fade-up 클래스를 가진 요소들을 Intersection Observer로 감지하여 애니메이션 적용
 * 같은 부모 내의 요소들은 자동으로 순차적으로 딜레이 적용
 */
function initFadeUp() {
  const fadeUpElements = document.querySelectorAll('.fade-in, .fade-in-up');
  
  if (fadeUpElements.length === 0) return;
  
  // 부모 요소별로 그룹화
  const parentGroups = new Map();
  
  fadeUpElements.forEach((element) => {
    // 부모 요소 찾기 (data-fade-group이 있으면 그것을 기준으로, 없으면 가장 가까운 공통 부모)
    let parent = element.parentElement;
    let groupKey = null;
    
    while (parent && parent !== document.body) {
      if (parent.hasAttribute('data-fade-group')) {
        groupKey = parent.getAttribute('data-fade-group');
        break;
      }
      // text-wrap, inner, section 등을 기준으로 그룹화
      if (parent.classList.contains('text-wrap') || 
          parent.classList.contains('inner') || 
          parent.tagName === 'SECTION') {
        // 같은 부모를 가진 요소들을 하나의 그룹으로
        groupKey = parent;
        break;
      }
      parent = parent.parentElement;
    }
    
    // 그룹 키가 없으면 요소의 직접 부모 사용
    if (!groupKey) {
      groupKey = element.parentElement || 'default';
    }
    
    if (!parentGroups.has(groupKey)) {
      parentGroups.set(groupKey, []);
    }
    
    parentGroups.get(groupKey).push({
      element: element,
      delay: element.hasAttribute('data-delay') ? parseFloat(element.getAttribute('data-delay')) : null
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
    sortedElements.forEach(item => {
      const rect = item.element.getBoundingClientRect();
      
      // 요소가 뷰포트 위로 완전히 지나갔으면 즉시 활성화
      if (rect.bottom < 0) {
        item.element.classList.add('is-visible');
        item.isPastViewport = true;
      } else {
        item.isPastViewport = false;
      }
    });
    
    // 아직 안 보이는 요소들만 필터링
    const elementsToObserve = sortedElements.filter(item => !item.isPastViewport);
    
    // 관찰할 요소가 있는 경우에만 Intersection Observer 설정
    if (elementsToObserve.length > 0) {
      const observerOptions = {
        root: null,
        rootMargin: '0px',
        threshold: 0.15 // 요소의 15%가 보이면 트리거
      };
      
      const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
          if (entry.isIntersecting) {
            // 해당 요소에 is-visible 클래스 추가
            entry.target.classList.add('is-visible');
            // 해당 요소는 더 이상 관찰하지 않음
            observer.unobserve(entry.target);
          }
        });
      }, observerOptions);
      
      // 아직 안 보이는 요소들을 개별적으로 관찰
      elementsToObserve.forEach(item => {
        observer.observe(item.element);
      });
      
      groupObservers.set(groupKey, observer);
    }
  });
}

/**
 * 카운트다운 초기화
 * 이벤트 날짜까지의 남은 시간을 계산하여 이미지로 표시
 */
function initCountdown() {
  // 이벤트 날짜 설정 (2026년 2월 3일 오전 10시, 스페인 시간대)
  // 스페인은 UTC+1 (CET, 중부유럽 표준시) 또는 UTC+2 (CEST, 중부유럽 일광절약시간) 사용
  // 2월은 일광절약시간이 아니므로 UTC+1 적용
  // 필요시 이 변수만 수정하면 됨
  const eventDate = new Date('2026-02-03T10:00:00+01:00');
  
  const countdownElements = document.querySelectorAll('.countdown');
  if (countdownElements.length === 0) return;
  
  // 각 countdown 요소마다 개별적으로 초기화
  countdownElements.forEach((countdownElement) => {
    initSingleCountdown(countdownElement, eventDate);
  });
  
  /**
   * 단일 countdown 요소 초기화
   * @param {HTMLElement} countdownElement - countdown 컨테이너 요소
   * @param {Date} eventDate - 이벤트 날짜
   */
  function initSingleCountdown(countdownElement, eventDate) {
    // countdown 요소에 white 또는 red 클래스 확인
    const imageColor = countdownElement.classList.contains('white') ? 'white' : 'red';
    const imagePrefix = `num_${imageColor}`;
    
    const dayElement = countdownElement.querySelector('.day');
    const hourElement = countdownElement.querySelector('.hour');
    const minuteElement = countdownElement.querySelector('.minute');
    const secondElement = countdownElement.querySelector('.second');
    
    // 이미지 요소를 미리 생성하고 재사용
    const imageElements = {
      day: null,
      hour: null,
      minute: null,
      second: null
    };
    
    // 현재 표시된 값 저장 (깜빡임 방지를 위해 변경된 경우만 업데이트)
    let currentValues = {
      days: null,
      hours: null,
      minutes: null,
      seconds: null
    };
    
    /**
     * 숫자를 두 자리 문자열로 변환 (한 자리면 앞에 0 추가)
     */
    function formatNumber(num) {
      return num.toString().padStart(2, '0');
    }
    
    /**
     * 이미지 경로 생성
     * @param {string} digit - 한 자리 숫자 (0-9)
     * @returns {string} 이미지 경로
     */
    function getImagePath(digit) {
      return `./assets/images/${imagePrefix}_${digit}.svg`;
    }
    
    /**
     * 요소에 이미지 요소를 초기화 (한 번만 실행)
     * @param {HTMLElement} container - 이미지를 표시할 컨테이너 요소
     * @param {string} key - imageElements 객체의 키
     */
    function initializeImages(container, key) {
      if (imageElements[key]) return; // 이미 초기화됨
      
      // 두 개의 이미지 요소를 미리 생성
      const img1 = document.createElement('img');
      img1.alt = '0';
      img1.loading = 'eager';
      
      const img2 = document.createElement('img');
      img2.alt = '0';
      img2.loading = 'eager';
      
      container.appendChild(img1);
      container.appendChild(img2);
      
      imageElements[key] = [img1, img2];
    }
    
    /**
     * 요소의 값을 업데이트 (변경된 경우만, 이미지 src만 변경)
     * @param {HTMLElement} element - 업데이트할 요소
     * @param {string} newValue - 새로운 두 자리 숫자 문자열
     * @param {string} valueKey - currentValues 객체의 키
     */
    function updateElementIfChanged(element, newValue, valueKey) {
      if (currentValues[valueKey] === newValue) return; // 변경되지 않음
      
      // 이미지 요소 초기화 (최초 한 번만)
      if (!imageElements[valueKey]) {
        initializeImages(element, valueKey);
      }
      
      // 각 자릿수의 이미지 src만 변경
      const [img1, img2] = imageElements[valueKey];
      const [digit1, digit2] = newValue.split('');
      
      img1.src = getImagePath(digit1);
      img1.alt = digit1;
      
      img2.src = getImagePath(digit2);
      img2.alt = digit2;
      
      currentValues[valueKey] = newValue;
    }
    
    /**
     * 카운트다운 업데이트
     */
    function updateCountdown() {
      const now = new Date();
      const timeDiff = eventDate.getTime() - now.getTime();
      
      // 이벤트 시간이 지났으면 모든 값을 00으로 표시
      if (timeDiff <= 0) {
        updateElementIfChanged(dayElement, '00', 'days');
        updateElementIfChanged(hourElement, '00', 'hours');
        updateElementIfChanged(minuteElement, '00', 'minutes');
        updateElementIfChanged(secondElement, '00', 'seconds');
        return;
      }
      
      // 남은 시간 계산
      const days = Math.floor(timeDiff / (1000 * 60 * 60 * 24));
      const hours = Math.floor((timeDiff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      const minutes = Math.floor((timeDiff % (1000 * 60 * 60)) / (1000 * 60));
      const seconds = Math.floor((timeDiff % (1000 * 60)) / 1000);
      
      // 변경된 경우만 업데이트 (깜빡임 방지)
      updateElementIfChanged(dayElement, formatNumber(days), 'days');
      updateElementIfChanged(hourElement, formatNumber(hours), 'hours');
      updateElementIfChanged(minuteElement, formatNumber(minutes), 'minutes');
      updateElementIfChanged(secondElement, formatNumber(seconds), 'seconds');
    }
    
    // 초기 업데이트
    updateCountdown();
    
    // 1초마다 업데이트
    setInterval(updateCountdown, 1000);
  }
}

/**
 * KV 영상 재생 제어
 * intro 영상 재생 완료 후 default 영상을 반복 재생
 * 768px 기준으로 모바일/데스크톱 영상 자동 전환
 */
const KV_BREAKPOINT = 768; // 모바일 기준점 (px)
let kvVideo = null;
let isKVIntroComplete = false;
let kvResizeTimer = null;

/**
 * 현재 화면 크기에 따른 모바일 여부 판단
 */
function isMobile() {
  return window.innerWidth <= KV_BREAKPOINT;
}

/**
 * 현재 화면 크기에 맞는 영상 파일 경로 반환
 * @param {string} type - 'intro' 또는 'default'
 * @returns {string} 영상 파일 경로
 */
function getVideoPath(type) {
  const isMob = isMobile();
  const prefix = isMob ? 'kv_' + type + '_m' : 'kv_' + type;
  return `./assets/videos/${prefix}.mp4`;
}

/**
 * 영상 소스 변경
 * @param {string} videoPath - 변경할 영상 파일 경로
 * @param {boolean} shouldLoop - 반복 재생 여부
 */
function changeVideoSource(videoPath, shouldLoop) {
  if (!kvVideo) return;

  kvVideo.src = videoPath;
  kvVideo.loop = shouldLoop;
  kvVideo.load(); // 새 소스 로드
  kvVideo.play().catch(err => {
    console.warn('Video autoplay failed:', err);
  });
}

/**
 * intro 영상 재생 완료 후 default 영상으로 전환
 */
function handleIntroComplete() {
  if (isKVIntroComplete) return;
  
  isKVIntroComplete = true;
  const defaultVideoPath = getVideoPath('default');
  changeVideoSource(defaultVideoPath, true); // default 영상은 반복 재생
}

/**
 * 화면 크기 변경 시 영상 재설정
 */
function handleKVResize() {
  // 디바운스 처리
  clearTimeout(kvResizeTimer);
  kvResizeTimer = setTimeout(() => {
    if (!kvVideo) return;

    const wasIntroComplete = isKVIntroComplete;
    const currentVideoPath = kvVideo.src;
    const currentIsMobile = currentVideoPath.includes('_m.mp4');
    const newIsMobile = isMobile();

    // 모바일/데스크톱 전환이 발생한 경우에만 영상 변경
    if (currentIsMobile !== newIsMobile) {
      if (wasIntroComplete) {
        // default 영상으로 변경
        const defaultVideoPath = getVideoPath('default');
        changeVideoSource(defaultVideoPath, true);
      } else {
        // intro 영상부터 다시 시작
        isKVIntroComplete = false;
        const introVideoPath = getVideoPath('intro');
        changeVideoSource(introVideoPath, false);
      }
    }
  }, 250); // 250ms 디바운스
}

/**
 * KV 영상 초기화
 */
function initKVVideo() {
  const videoBx = document.querySelector('.kv .video-bx');
  if (!videoBx) return;

  kvVideo = videoBx.querySelector('video');
  if (!kvVideo) return;

  // 초기 intro 영상 설정
  const introVideoPath = getVideoPath('intro');
  kvVideo.src = introVideoPath;
  kvVideo.loop = false; // intro는 반복하지 않음
  kvVideo.muted = true;
  kvVideo.playsInline = true;
  kvVideo.autoplay = true;
  kvVideo.preload = 'auto';

  // intro 영상 재생 완료 이벤트 리스너
  kvVideo.addEventListener('ended', handleIntroComplete, { once: false });

  // 리사이즈 이벤트 리스너
  window.addEventListener('resize', handleKVResize);

  // 영상 로드 및 재생 시도
  kvVideo.load();
  kvVideo.play().catch(err => {
    console.warn('Video autoplay failed:', err);
  });
}

/**
 * share btn click event
 */
function handleShareBtnClick() {
  const shareBtn = document.querySelector('.share-btn');
  if (!shareBtn) return;
  shareBtn.addEventListener('click', () => {
    const layerPopup = document.querySelector('.layer-popup');
    if (!layerPopup) return;
    
    const isActivating = !layerPopup.classList.contains('active');
    layerPopup.classList.toggle('active');
    layerPopup.setAttribute('aria-hidden', !layerPopup.classList.contains('active'));
    
    // 팝업이 활성화될 때 첫 번째 포커스 가능한 요소로 포커스 이동
    if (isActivating) {
      setTimeout(() => {
        // 팝업 내 첫 번째 포커스 가능한 요소 찾기 (SNS 링크 또는 input)
        const firstFocusable = layerPopup.querySelector('a, button, input');
        if (firstFocusable) {
          firstFocusable.focus();
        }
      }, 100); // CSS transition 고려하여 약간의 딜레이
    }
  });
}

/**
 * close btn click event
 */
function handleCloseBtnClick() {
  const closeBtn = document.querySelector('.close-btn');
  if (!closeBtn) return;
  closeBtn.addEventListener('click', () => {
    const layerPopup = document.querySelector('.layer-popup');
    if (!layerPopup) return;
    
    const shareBtn = document.querySelector('.share-btn');
    layerPopup.classList.remove('active');
    
    // 팝업 닫을 때 원래 버튼으로 포커스 복귀
    if (shareBtn) {
      shareBtn.focus();
    }
  });
}

/**
 * ESC key event for closing popup
 */
function handleEscapeKey() {
  document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape') {
      const layerPopup = document.querySelector('.layer-popup');
      if (!layerPopup || !layerPopup.classList.contains('active')) return;
      
      const shareBtn = document.querySelector('.share-btn');
      layerPopup.classList.remove('active');
      
      // ESC로 닫을 때도 원래 버튼으로 포커스 복귀
      if (shareBtn) {
        shareBtn.focus();
      }
    }
  });
}

/**
 * copy link button click event
 */
function handleCopyLinkBtnClick() {
  const copyLinkBtn = document.querySelector('.copy-link-btn');
  const copyLinkText = document.querySelector('.copy-link-text');
  const toastPopup = document.querySelector('.layer-popup .toast-popup');
  
  if (!copyLinkBtn || !copyLinkText) return;
  
  copyLinkBtn.addEventListener('click', async () => {
    try {
      const linkText = copyLinkText.textContent.trim();
      
      // Clipboard API 사용 (모던 브라우저)
      if (navigator.clipboard && navigator.clipboard.writeText) {
        await navigator.clipboard.writeText(linkText);
      } else {
        // 구형 브라우저 대비 fallback
        // 임시 textarea 생성하여 복사
        const textarea = document.createElement('textarea');
        textarea.value = linkText;
        textarea.style.position = 'fixed';
        textarea.style.opacity = '0';
        document.body.appendChild(textarea);
        textarea.select();
        document.execCommand('copy');
        document.body.removeChild(textarea);
      }
      
      // 토스트 팝업 표시
      if (toastPopup) {
        toastPopup.style.opacity = '1';
        toastPopup.style.visibility = 'visible';

        // 4초 후 토스트 팝업 숨김
        setTimeout(() => {
          toastPopup.style.opacity = '0';
          toastPopup.style.visibility = 'hidden';
        }, 4000);
      }
    } catch (err) {
      console.error('링크 복사 실패:', err);
      // 에러 발생 시 사용자에게 알림 (옵션)
      alert('링크 복사에 실패했습니다. 직접 복사해주세요.');
    }
  });
}

/**
 * scroll down button click event
 */
function handleScrollDownBtnClick() {
  const scrollDownBtn = document.querySelector('.kv .scroll-down-btn');
  if (!scrollDownBtn) return;
  
  scrollDownBtn.addEventListener('click', () => {
    // 다음 섹션(overview) 찾기
    const kvSection = document.querySelector('.kv');
    if (!kvSection) return;
    
    // 다음 형제 섹션 찾기
    const nextSection = kvSection.nextElementSibling;
    if (!nextSection) return;
    
    // 부드러운 스크롤
    nextSection.scrollIntoView({
      behavior: 'smooth',
      block: 'start'
    });
  });
}

/**
 * 초대장 코드 복사 토스트 팝업 제어
 * 코드 버튼 클릭 시 코드를 클립보드에 복사하고 토스트 팝업을 표시한 후 4초 후 자동으로 숨김
 */
function handleCodeButtonClick() {
  const codeButton = document.querySelector('.invitation .code');
  const toastPopup = document.querySelector('.invitation .toast-popup');
  
  if (!codeButton || !toastPopup) return;

  codeButton.addEventListener('click', async () => {
    try {
      // 코드 버튼의 텍스트 내용 가져오기 (ISE260710)
      const codeText = codeButton.textContent.trim();
      
      // 클립보드에 복사
      if (navigator.clipboard && navigator.clipboard.writeText) {
        await navigator.clipboard.writeText(codeText);
      } else {
        // 구형 브라우저 대비 fallback
        // 임시 textarea 생성하여 복사
        const textarea = document.createElement('textarea');
        textarea.value = codeText;
        textarea.style.position = 'fixed';
        textarea.style.opacity = '0';
        document.body.appendChild(textarea);
        textarea.select();
        document.execCommand('copy');
        document.body.removeChild(textarea);
      }
      
      // 토스트 팝업 표시
      toastPopup.style.opacity = '1';
      toastPopup.style.visibility = 'visible';

      // 4초 후 토스트 팝업 숨김
      setTimeout(() => {
        toastPopup.style.opacity = '0';
        toastPopup.style.visibility = 'hidden';
      }, 4000);
    } catch (err) {
      console.error('코드 복사 실패:', err);
      // 에러 발생 시 사용자에게 알림
      alert('코드 복사에 실패했습니다. 직접 복사해주세요.');
    }
  });
}

/**
 * 초대장 카드 flip 기능 초기화
 * 버튼 클릭 시 card-front에서 card-back으로 전환되도록 flip 모션 적용
 */
function handleFlipCard() {
  const cardBx = document.querySelector('.invitation .card-bx');
  const flipBtns = document.querySelectorAll('.invitation .flip-btn');
  
  if (!cardBx || !flipBtns || flipBtns.length === 0) return;
  
  // flip 버튼 클릭 이벤트 (모든 flip-btn에 적용)
  flipBtns.forEach(function(flipBtn) {
    flipBtn.addEventListener('click', function() {
      cardBx.classList.toggle('flipped');
    });
  });
}

function handleInspirationSlide() {
  const inspirationSlide = document.querySelector('.inspiration .slide-bx');
  const inspirationSlideSwiper = new Swiper(inspirationSlide, {
    slidesPerView: 1.2,
    centeredSlides: false,
    spaceBetween: 8,
    loop:true,
    speed: 1000,
    autoplay: {
      delay: 4000,
      disableOnInteraction: false,
    },
    pagination: {
      el: '.inspiration .slide-pagination',
      type: 'fraction',
    },
    navigation: {
      nextEl: '.inspiration .slide-bx .slide-btn-next',
      prevEl: '.inspiration .slide-bx .slide-btn-prev',
    },
    breakpoints: {
      768: {
        slidesPerView: "auto",
        spaceBetween: 0,
        centeredSlides: true,
      },
    },
  });
}

/**
 * FAQ 아코디언 기능 초기화
 * faq-question 버튼 클릭 시 해당 faq-answer를 부드럽게 토글
 * 웹 접근성: ARIA 속성 및 키보드 접근성 지원
 * 반응형: PC(768px 이상)는 첫 번째 항목 활성화, 모바일(767px 이하)은 닫힘
 */
function handleFaqAccordion() {
  const faqQuestions = document.querySelectorAll('.faq .faq-question');
  
  if (faqQuestions.length === 0) return;
  
  // 반응형 기준점 (768px)
  const DESKTOP_BREAKPOINT = 768;
  
  // 화면 크기 확인 함수
  const isDesktop = () => window.innerWidth >= DESKTOP_BREAKPOINT;
  
  faqQuestions.forEach((questionBtn, index) => {
    const faqItem = questionBtn.closest('.faq-item');
    if (!faqItem) return;
    
    const faqAnswer = faqItem.querySelector('.faq-answer');
    if (!faqAnswer) return;
    
    // 고유 ID 생성 (없는 경우에만)
    const answerId = faqAnswer.id || `faq-answer-${index}`;
    faqAnswer.id = answerId;
    
    // 버튼 ID가 없으면 생성
    const questionId = questionBtn.id || `faq-question-${index}`;
    questionBtn.id = questionId;
    
    // ARIA 속성 초기 설정 (HTML에 없으면 추가)
    if (!questionBtn.hasAttribute('aria-expanded')) {
      questionBtn.setAttribute('aria-expanded', 'false');
    }
    if (!questionBtn.hasAttribute('aria-controls')) {
      questionBtn.setAttribute('aria-controls', answerId);
    }
    if (!faqAnswer.hasAttribute('role')) {
      faqAnswer.setAttribute('role', 'region');
    }
    if (!faqAnswer.hasAttribute('aria-labelledby')) {
      faqAnswer.setAttribute('aria-labelledby', questionId);
    }
    
    /**
     * 아코디언 토글 함수
     */
    const toggleAccordion = () => {
      // 현재 열려있는지 확인
      const isActive = faqItem.classList.contains('active');
      
      // 모든 faq-item에서 active 클래스 제거 (하나만 열리도록)
      document.querySelectorAll('.faq .faq-item').forEach((item) => {
        if (item !== faqItem) {
          item.classList.remove('active');
          const otherAnswer = item.querySelector('.faq-answer');
          const otherButton = item.querySelector('.faq-question');
          if (otherAnswer && otherButton) {
            otherButton.setAttribute('aria-expanded', 'false');
          }
        }
      });
      
      // 클릭된 항목 토글
      if (isActive) {
        faqItem.classList.remove('active');
        questionBtn.setAttribute('aria-expanded', 'false');
      } else {
        faqItem.classList.add('active');
        questionBtn.setAttribute('aria-expanded', 'true');
      }
    };
    
    // 클릭 이벤트
    questionBtn.addEventListener('click', toggleAccordion);
    
    // 키보드 접근성: Space와 Enter 키 지원
    questionBtn.addEventListener('keydown', (e) => {
      if (e.key === 'Enter' || e.key === ' ') {
        e.preventDefault(); // Space 키의 기본 스크롤 동작 방지
        toggleAccordion();
      }
    });
  });
  
  // 초기 로드 시 화면 크기에 따라 첫 번째 항목 활성화/비활성화
  const firstItem = document.querySelector('.faq .faq-item:first-child');
  const firstButton = firstItem?.querySelector('.faq-question');
  const firstAnswer = firstItem?.querySelector('.faq-answer');
  
  if (firstItem && firstButton && firstAnswer) {
    if (isDesktop()) {
      // PC: 첫 번째 항목 활성화
      firstItem.classList.add('active');
      firstButton.setAttribute('aria-expanded', 'true');
    } else {
      // 모바일: 모든 항목 닫힘
      firstItem.classList.remove('active');
      firstButton.setAttribute('aria-expanded', 'false');
    }
  }
}

/**
 * 인디케이터 기능 초기화
 * 스크롤 시 현재 보이는 섹션에 해당하는 인디케이터에 active 클래스 추가
 * 인디케이터 클릭 시 해당 섹션으로 부드럽게 스크롤
 * 768px 이상(데스크톱)에서만 작동
 */
const INDICATOR_BREAKPOINT = 768; // 모바일 기준점 (px)
let indicatorObserver = null;
let indicatorUpdateTimer = null;
let indicatorResizeTimer = null;
let indicatorClickHandler = null;

/**
 * 현재 화면 크기가 데스크톱인지 확인
 */
function isDesktopForIndicator() {
  return window.innerWidth >= INDICATOR_BREAKPOINT;
}

/**
 * 인디케이터 기능 정리 (observer disconnect 및 타이머 정리)
 */
function cleanupIndicator() {
  if (indicatorObserver) {
    indicatorObserver.disconnect();
    indicatorObserver = null;
  }
  if (indicatorUpdateTimer) {
    clearTimeout(indicatorUpdateTimer);
    indicatorUpdateTimer = null;
  }
  // 클릭 이벤트 리스너 제거
  const indicatorList = document.querySelector('.indicator-list');
  if (indicatorList && indicatorClickHandler) {
    indicatorList.removeEventListener('click', indicatorClickHandler);
    indicatorClickHandler = null;
  }
}

function handleIndicator() {
  const indicatorItems = document.querySelectorAll('.indicator-item');
  const indicatorList = document.querySelector('.indicator-list');
  const sections = document.querySelectorAll('.kv, .overview, .inspiration, .invitation, .faq');
  
  if (indicatorItems.length === 0 || sections.length === 0) return;
  
  // 768px 미만이면 초기화하지 않음
  if (!isDesktopForIndicator()) {
    cleanupIndicator();
    return;
  }
  
  // 섹션과 인디케이터 매핑
  const sectionMap = new Map();
  sections.forEach((section) => {
    const sectionClass = section.className.split(' ').find(cls => 
      ['kv', 'overview', 'inspiration', 'invitation', 'faq'].includes(cls)
    );
    if (sectionClass) {
      sectionMap.set(sectionClass, section);
    }
  });
  
  // dark-mode가 필요한 섹션 목록
  const darkModeSections = ['inspiration', 'faq'];
  
  // 현재 활성화된 섹션 추적
  let currentActiveSection = null;
  // 섹션별 intersectionRatio 저장
  const sectionRatios = new Map();
  
  /**
   * 인디케이터 active 상태 업데이트
   * @param {string} sectionClass - 활성화할 섹션 클래스명
   */
  function updateActiveIndicator(sectionClass) {
    if (currentActiveSection === sectionClass) return;
    
    // 모든 인디케이터에서 active 클래스 제거
    indicatorItems.forEach((item) => {
      item.classList.remove('active');
    });
    
    // 해당 섹션에 맞는 인디케이터 찾아서 active 클래스 추가
    indicatorItems.forEach((item) => {
      const button = item.querySelector('button[data-section]');
      if (button && button.getAttribute('data-section') === sectionClass) {
        item.classList.add('active');
        currentActiveSection = sectionClass;
      }
    });
    
    // dark-mode 클래스 업데이트
    if (indicatorList) {
      if (darkModeSections.includes(sectionClass)) {
        indicatorList.classList.add('dark-mode');
      } else {
        indicatorList.classList.remove('dark-mode');
      }
    }
  }
  
  /**
   * Intersection Observer로 섹션 감지
   */
  const observerOptions = {
    root: null,
    rootMargin: '-30% 0px -30% 0px', // 화면 중앙 40% 영역에서 감지 (더 엄격하게)
    threshold: [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1] // 더 세밀한 감지
  };
  
  // 기존 observer가 있으면 정리
  cleanupIndicator();
  
  indicatorObserver = new IntersectionObserver((entries) => {
    // 각 섹션의 intersectionRatio 업데이트
    entries.forEach((entry) => {
      const sectionClass = entry.target.className.split(' ').find(cls => 
        ['kv', 'overview', 'invitation', 'inspiration',  'faq'].includes(cls)
      );
      if (sectionClass) {
        sectionRatios.set(sectionClass, entry.isIntersecting ? entry.intersectionRatio : 0);
      }
    });
    
    // 디바운싱 적용 (100ms 지연)
    clearTimeout(indicatorUpdateTimer);
    indicatorUpdateTimer = setTimeout(() => {
      // 현재 활성 섹션의 비율
      const currentRatio = currentActiveSection ? (sectionRatios.get(currentActiveSection) || 0) : 0;
      
      // 가장 많이 보이는 섹션 찾기
      let maxIntersection = 0;
      let mostVisibleSection = null;
      
      sectionRatios.forEach((ratio, sectionClass) => {
        if (ratio > maxIntersection) {
          maxIntersection = ratio;
          mostVisibleSection = sectionClass;
        }
      });
      
      // 히스테리시스 적용: 현재 활성 섹션이 0.2 이상 보이면 유지
      // 또는 다른 섹션이 현재 섹션보다 0.15 이상 더 많이 보일 때만 전환
      if (mostVisibleSection) {
        const shouldSwitch = 
          currentRatio < 0.2 || // 현재 섹션이 거의 안 보임
          (maxIntersection - currentRatio > 0.15); // 다른 섹션이 훨씬 더 많이 보임
        
        if (shouldSwitch && mostVisibleSection !== currentActiveSection) {
          updateActiveIndicator(mostVisibleSection);
        }
      }
    }, 100); // 100ms 디바운스
  }, observerOptions);
  
  // 모든 섹션 관찰 시작
  sections.forEach((section) => {
    indicatorObserver.observe(section);
  });
  
  /**
   * 인디케이터 클릭 이벤트 (이벤트 위임 사용)
   * 클릭 시 해당 섹션으로 부드럽게 스크롤
   */
  if (indicatorList) {
    // 기존 이벤트 리스너가 있으면 제거 (중복 방지)
    if (indicatorClickHandler) {
      indicatorList.removeEventListener('click', indicatorClickHandler);
    }
    
    // 클릭 이벤트 핸들러 생성
    indicatorClickHandler = (e) => {
      const button = e.target.closest('button[data-section]');
      if (!button) return;
      
      const sectionClass = button.getAttribute('data-section');
      const targetSection = sectionMap.get(sectionClass);
      
      if (targetSection) {
        // 부드러운 스크롤
        targetSection.scrollIntoView({
          behavior: 'smooth',
          block: 'start'
        });
      }
    };
    
    // 이벤트 리스너 등록
    indicatorList.addEventListener('click', indicatorClickHandler);
  }
  
  // 초기 로드 시 첫 번째 섹션(kv) 활성화
  updateActiveIndicator('kv');
}

/**
 * 인디케이터 리사이즈 핸들러
 * 화면 크기 변경 시 768px 기준으로 초기화 또는 정리
 */
function handleIndicatorResize() {
  clearTimeout(indicatorResizeTimer);
  indicatorResizeTimer = setTimeout(() => {
    if (isDesktopForIndicator()) {
      // 768px 이상이면 초기화
      handleIndicator();
    } else {
      // 768px 미만이면 정리
      cleanupIndicator();
    }
  }, 250); // 250ms 디바운스
}

/**
 * footer 네비게이션 버튼 클릭 이벤트
 * 버튼 클릭 시 해당 섹션으로 부드럽게 스크롤
 */
function handleFooterNavClick() {
  const footerNavLinks = document.querySelectorAll('.ise-footer .nav-link[data-section]');
  
  if (footerNavLinks.length === 0) return;
  
  // 섹션 매핑
  const sectionMap = new Map();
  const sections = document.querySelectorAll('.kv, .overview, .inspiration, .invitation, .faq');
  
  sections.forEach((section) => {
    const sectionClass = section.className.split(' ').find(cls => 
      ['kv', 'overview', 'inspiration', 'invitation', 'faq'].includes(cls)
    );
    if (sectionClass) {
      sectionMap.set(sectionClass, section);
    }
  });
  
  // 각 버튼에 클릭 이벤트 리스너 추가
  footerNavLinks.forEach((button) => {
    button.addEventListener('click', () => {
      const sectionClass = button.getAttribute('data-section');
      const targetSection = sectionMap.get(sectionClass);
      
      if (targetSection) {
        // 부드러운 스크롤
        targetSection.scrollIntoView({
          behavior: 'smooth',
          block: 'start'
        });
      }
    });
  });
}

/**
 * 모든 기능 초기화
 */
function init() {
  initFadeUp();
  initCountdown();
  initKVVideo();
  handleShareBtnClick();
  handleCloseBtnClick();
  handleEscapeKey();
  handleCopyLinkBtnClick();
  handleScrollDownBtnClick();
  handleCodeButtonClick();
  handleFlipCard();
  handleInspirationSlide();
  handleFaqAccordion();
  handleIndicator();
  handleFooterNavClick();
  
  // 인디케이터 리사이즈 이벤트 리스너 등록
  window.addEventListener('resize', handleIndicatorResize);
}

// DOM 로드 후 초기화
if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', init);
} else {
  init();
}

// 동적으로 추가된 요소를 위해 재실행 가능하도록 함수 export (필요시)
window.reinitFadeUp = initFadeUp;