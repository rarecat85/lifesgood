document.addEventListener("DOMContentLoaded", function () {

    gsap.registerPlugin(ScrollTrigger);

    // "Click to get started" 버튼 애니메이션
    function bannerFlolatingAnimation() {
        // 시작 요소 입력 필요
        const startElement = document.querySelector('.test .test-btn');
        const endElement = document.querySelector('.banner-main-area-startbtn');

        // 시작 요소의 위치와 끝 요소 위치 계산값
        const startDetailPosition = startElement.getBoundingClientRect().top + window.scrollY;
        const endDetailPosition = endElement.getBoundingClientRect().top + window.scrollY;

        // 시작 요소와 끝 요소간의 거리 계산값
        const distance = endDetailPosition - startDetailPosition;

       // 수정 필요(떨림 현상 있음)
        gsap.fromTo(endElement, {
            y: -distance,
        }, {
            y: 0,
            ease: 'none',
            scrollTrigger: {
                trigger: startElement,
                start: 'top 90%',
                end: `+=${distance} 90.1%`,
                scrub: true,
                // markers: true,
            }
        })
    }

    // 배너 음악 컨트롤 애니메이션 
    function bannerMusicControlAnimation() {
        const bannerStopbtn = document.querySelector('.banner-main-area-controls .stop-btn');

        bannerStopbtn.addEventListener('click', function () {
            if (bannerStopbtn.getAttribute('aria-pressed') === 'true') {
                bannerStopbtn.setAttribute('aria-pressed', 'false');
                bannerStopbtn.setAttribute('aria-label', 'play');
            } else {
                bannerStopbtn.setAttribute('aria-pressed', 'true');
                bannerStopbtn.setAttribute('aria-label', 'pause');
            }
        });
    }

    // 배너 이미지 겹칩 애니메이션
    function bannerImageAnimation() {
        // pc 이미지(좌우) 객체화 
        // setTimeout + 반복문 조합으로 이미지 넣기
    }


    // handleResize() 필요
    bannerFlolatingAnimation();
    bannerMusicControlAnimation();
    bannerImageAnimation();
});