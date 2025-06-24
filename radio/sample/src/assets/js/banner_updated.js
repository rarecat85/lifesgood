let bannerScrollTrigger = null;

// 배너 플로팅 함수
function bannerFlolatingAnimation() {
    // 시작 요소(요소의 시작값 혹은 끝값만 가능)
    const startElement = document.querySelector('.overview-heading-img');
    // 끝 요소(요소의 시작값 혹은 끝값만 가능)
    const endElement = document.querySelector('.banner-main-area-startbtn');

    // 이전 스크롤 트리거 요소 제거
    gsap.set(endElement, {
        clearProps: 'transform'
    });

    if (bannerScrollTrigger) {
        bannerScrollTrigger.kill();
    }

    // 시작 요소의 위치, 끝 요소 위치 계산값
    const startDetailPosition = startElement.getBoundingClientRect().bottom + window.scrollY;
    const endDetailPosition = endElement.getBoundingClientRect().top + window.scrollY;


    // 시작 요소와 끝 요소간의 거리 계산값 
    const distance = Math.abs(endDetailPosition - startDetailPosition);

    bannerScrollTrigger = gsap.from(endElement, {
        y: -distance,
        ease: 'none',
        scrollTrigger: {
            trigger: startElement,
            start: 'bottom 90%',
            end: `+=${distance} 90.1%`,
            scrub: 0.5,
        }
    })
}

// 리사이즈 함수 
function handleResize() {
    bannerFlolatingAnimation();
}

// 디바운스 함수
function debounce(func, delay = 500) {
    let timer;
    return function (...args) {
        if (timer) clearTimeout(timer);
        timer = setTimeout(() => func.apply(this, args), delay);
    }
}

// 배너 init 함수
function initBanner() {
    bannerFlolatingAnimation();

    window.addEventListener('resize', debounce(handleResize));
}

// 페이지 로드가 완전히 끝난 후에 초기화
window.addEventListener('load', function() {
  // 추가로 약간의 지연을 두어 모든 리소스가 완전히 렌더링된 후 실행
  setTimeout(() => {
      initBanner();
  }, 100);
});