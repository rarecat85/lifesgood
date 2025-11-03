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
    
    // 그룹의 트리거 요소 결정 (첫 번째 요소)
    const firstElement = sortedElements[0].element;
    
    // 그룹별 Intersection Observer 생성
    const observerOptions = {
      root: null,
      rootMargin: '0px',
      threshold: 0.15 // 요소의 15%가 보이면 트리거
    };
    
    const observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          // 같은 그룹의 모든 요소에 is-visible 클래스 추가
          sortedElements.forEach(item => {
            item.element.classList.add('is-visible');
          });
          // 한 번만 실행되도록 observe 해제
          observer.disconnect();
        }
      });
    }, observerOptions);
    
    // 그룹의 첫 번째 요소를 관찰 시작
    observer.observe(firstElement);
    groupObservers.set(groupKey, observer);
  });
}

/**
 * 카운트다운 초기화
 * 이벤트 날짜까지의 남은 시간을 계산하여 이미지로 표시
 */
function initCountdown() {
  // 이벤트 날짜 설정 (2026년 2월 3일 자정)
  // 필요시 이 변수만 수정하면 됨
  const eventDate = new Date('2026-02-03T00:00:00');
  
  const countdownElement = document.querySelector('.countdown');
  if (!countdownElement) return;
  
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

// DOM 로드 후 초기화
document.addEventListener('DOMContentLoaded', () => {
  initFadeUp();
  initCountdown();
});

// 동적으로 추가된 요소를 위해 재실행 가능하도록 함수 export (필요시)
window.reinitFadeUp = initFadeUp;