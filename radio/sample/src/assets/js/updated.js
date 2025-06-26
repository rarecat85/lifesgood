// 일괄 주석 처리 : 배너 업데이트 반영분(250626)

// let isMobile = false;
// let bannerScrollTrigger = null;

// // 배너 플로팅 함수
// function bannerFlolatingAnimation() {
//     const radioContainer = document.querySelector('.radio-container');
//     const floatingBtn = document.querySelector('.banner-main-area-startbtn-fixed');
//     const overviewContainer = document.querySelector('.overview');
//     const bannerBtn = document.querySelector('.banner-main-area-startbtn');

//     // 애니메이션 초기화 
//     if (bannerScrollTrigger) bannerScrollTrigger.kill();

//     // 버튼들 기본값 설정
//     bannerBtn.style.opacity = 1;
//     floatingBtn.style.visibility = 'hidden';

//     // 배너 스크롤 트리거 
//     bannerScrollTrigger = gsap.from(floatingBtn, {
//         ease: 'none',
//         scrollTrigger: {
//             trigger: radioContainer,
//             scrub: true,
//             onUpdate: () => {
//                 // 오버뷰 섹션 바텀 위치, 플로팅 버튼, 배너 버튼(제자리 고정 버튼) 위치 확인
//                 const overviewRect = overviewContainer.getBoundingClientRect();
//                 const floatingBtnRect = floatingBtn.getBoundingClientRect();
//                 const bannerBtnRect = bannerBtn.getBoundingClientRect();

//                 // 오버뷰 섹션 바텀 위치가 플로팅 바텀 위치보다 아래에 있을 때, 플로팅 버튼 숨김 처리
//                 if (floatingBtnRect.bottom < overviewRect.bottom && floatingBtnRect.bottom < bannerBtnRect.top) {
//                     bannerBtn.style.opacity = 1;
//                     floatingBtn.style.visibility = 'hidden';
//                 }

//                 // 오버뷰 섹션 바텀 위치가 플로팅 바텀 위치보다 위에 있을 때, 플로팅 버튼 등장 처리
//                 if (floatingBtnRect.bottom > overviewRect.bottom && floatingBtnRect.bottom < bannerBtnRect.top) {
//                     bannerBtn.style.opacity = 0;
//                     floatingBtn.style.visibility = 'visible';
//                 }

//                 // 플로팅 버튼이 베너 버튼보다 위에 있을 때, 플로팅 버튼 등장 처리
//                 if (floatingBtnRect.bottom > overviewRect.bottom && floatingBtnRect.bottom < bannerBtnRect.top) {
//                     bannerBtn.style.opacity = 0;
//                     floatingBtn.style.visibility = 'visible';
//                 }

//                 // 플로팅 버튼이 베너 버튼보다 아래에 있을 때, 플로팅 버튼 숨김 처리
//                 if (floatingBtnRect.bottom > overviewRect.bottom && floatingBtnRect.bottom > bannerBtnRect.top) {
//                     bannerBtn.style.opacity = 1;
//                     floatingBtn.style.visibility = 'hidden';
//                 }
//             }
//         }
//     })
// }

// // 리사이즈 함수 
// function handleResize() {
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