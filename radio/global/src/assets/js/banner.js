// 수정 미반영분(scrub : 0.3 만 변경)

let isMobile = false;
let bannerScrollTrigger = null;

// 배너 플로팅 함수
function bannerFlolatingAnimation() {
    // 시작 요소 입력 필요
    const startElement = document.querySelector('.overview');
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
            end: `+=${distance} 88%`,
            scrub: 0.3,
        }
    })
}

// 리사이즈 함수 
function handleResize() {
    // 모바일에서 리사이즈 이벤트 무시
    if (!isMobile) {
        bannerFlolatingAnimation();
    }
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
window.addEventListener('load', function () {
    isMobile = window.matchMedia('(max-width: 768px)').matches;

    // 추가로 약간의 지연을 두어 모든 리소스가 완전히 렌더링된 후 실행
    setTimeout(() => {
        initBanner();
    }, 100);
});

// 수정(플로팅 버튼 시작 지점 변경 / 모바일 기기 하단 주소창 고려 / scrub : 0.3 / 모바일 리사이즈 이벤트 제외)

// let isMobile = false;
// let bannerScrollTrigger = null;

// // 배너 플로팅 함수
// function bannerFlolatingAnimation() {
//     // 시작 요소(요소의 시작값 혹은 끝값만 가능)
//     const startElement = document.querySelector('.overview-heading-img');
//     // 끝 요소(요소의 시작값 혹은 끝값만 가능)
//     const endElement = document.querySelector('.banner-main-area-startbtn');

//     // 이전 스크롤 트리거 요소 제거
//     gsap.set(endElement, {
//         clearProps: 'transform'
//     });

//     if (bannerScrollTrigger) {
//         bannerScrollTrigger.kill();
//     }

//     // 시작 요소의 위치, 끝 요소 위치 계산값
//     const startDetailPosition = startElement.getBoundingClientRect().bottom + window.scrollY;
//     const endDetailPosition = endElement.getBoundingClientRect().top + window.scrollY;

//     // 시작 요소와 끝 요소간의 거리 계산값 
//     const distance = Math.abs(endDetailPosition - startDetailPosition);

//     if (!isMobile) {
//         // 태블릿 이상 애니메이션 
//          if (bannerScrollTrigger) {
//             bannerScrollTrigger.kill();
//             bannerScrollTrigger = null;
//         }

//         bannerScrollTrigger = gsap.from(endElement, {
//             y: -distance,
//             ease: 'none',
//             scrollTrigger: {
//                 trigger: startElement,
//                 start: 'bottom 90%',
//                 end: `+=${distance} 88%`,
//                 scrub: 0.25,
//             }
//         })
//     } else {
//         // 모바일 애니메이션 
//         if (bannerScrollTrigger) {
//             bannerScrollTrigger.kill();
//             bannerScrollTrigger = null;
//         }

//         bannerScrollTrigger = gsap.from(endElement, {
//             y: -distance,
//             ease: 'none',
//             scrollTrigger: {
//                 trigger: startElement,
//                 start: 'bottom 80%',
//                 end: `+=${distance} 80%`,
//                 scrub: 0.3,
//             }
//         })
//     }
// }

// // 리사이즈 함수 
// function handleResize() {
//     isMobile = window.matchMedia('(max-width: 768px)').matches;

//     // 모바일에서 리사이즈 이벤트 무시
//     if (!isMobile) {
//         bannerFlolatingAnimation();
//     }
// }

// // 디바운스 함수
// function debounce(func, delay = 500) {
//     let timer;
//     return function (...args) {
//         if (timer) clearTimeout(timer);
//         timer = setTimeout(() => func.apply(this, args), delay);
//     }
// }

// // 배너 init 함수
// function initBanner() {
//     bannerFlolatingAnimation();

//     window.addEventListener('resize', debounce(handleResize));
// }

// // 페이지 로드가 완전히 끝난 후에 초기화
// window.addEventListener('load', function () {
//     isMobile = window.matchMedia('(max-width: 768px)').matches;

//     // 추가로 약간의 지연을 두어 모든 리소스가 완전히 렌더링된 후 실행
//     setTimeout(() => {
//         initBanner();
//     }, 100);
// });