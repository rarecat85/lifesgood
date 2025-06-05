gsap.registerPlugin(ScrollTrigger);

let bannerScrollTrigger = null;

// 배너 플로팅 함수
// function bannerFlolatingAnimation() {
//     // 시작 요소 입력 필요
//     const startElement = document.querySelector('.test .test-btn');
//     const endElement = document.querySelector('.banner-main-area-startbtn');

//     // 이전 스크롤 트리거 요소 제거
//     gsap.set(endElement, {
//         clearProps: 'transform'
//     });

//       if (bannerScrollTrigger) {
//         console.log('배너 스크롤 트리거 제거');

//         bannerScrollTrigger.kill();
//     }

//     // 시작 요소의 위치, 끝 요소 위치 계산값
//     const startDetailPosition = startElement.getBoundingClientRect().top + window.scrollY;
//     const endDetailPosition = endElement.getBoundingClientRect().top + window.scrollY;

//     // 시작 요소와 끝 요소간의 거리 계산값 
//     const distance = endDetailPosition - startDetailPosition;

//     console.log('distance:', distance);

//     bannerScrollTrigger = gsap.from(endElement, {
//         y: -distance,
//         ease: 'none',
//         scrollTrigger: {
//             trigger: startElement,
//             start: 'top 90%',
//             end: `+=${distance} 90%`,
//             scrub: true,
//             // scrub: 0.5,
//         }
//     })
// }

// 배너 컨트롤러 함수(장식용인지 확인 필요)
// function bannerMusicControlAnimation() {
//     const bannerStopbtn = document.querySelector('.banner-main-area-controls .stop-btn');

//     bannerStopbtn.addEventListener('click', function () {
//         const isStoped = bannerStopbtn.getAttribute('aria-pressed');

//         if (isStoped === 'true') {
//             bannerStopbtn.setAttribute('aria-label', 'play');
//             bannerStopbtn.setAttribute('aria-pressed', 'false');
//         } else {
//             bannerStopbtn.setAttribute('aria-label', 'pause');
//             bannerStopbtn.setAttribute('aria-pressed', 'true');
//         }
//     });
// }

// 리사이즈 함수 
function handleResize() {
    // bannerFlolatingAnimation();
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
    // bannerFlolatingAnimation();
    // bannerMusicControlAnimation();

    window.addEventListener('resize', debounce(handleResize));

    window.addEventListener('load', () => {
        document.querySelector('body').classList.remove('noscroll');
    })
}

initBanner();