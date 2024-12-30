document.addEventListener("DOMContentLoaded",function(){
    const heroVideo = document.querySelector('.hero-visual video');
    const heroToggleBtn = document.querySelector('.play-btn');
    heroToggleBtn.addEventListener('click',function(){
        if (this.classList.contains("active")) {
            this.classList.remove("active");
            heroVideo.play();
        }
        else {
            this.classList.add("active");
            heroVideo.pause();
        }
    });

    gsap.registerPlugin(ScrollTrigger);
    ScrollTrigger.matchMedia({
        // PC용 스크롤 트리거
        "(min-width: 1025px)": function() {
            const secOverflow = document.querySelector('section.overview');
            const symbol = document.querySelector('.logo-wrap.png-bx .symbol');
            const symbolGif = document.querySelector('.logo-wrap.gif-bx .gif');
            const heroVisual1 = gsap.timeline({
                scrollTrigger: {
                    trigger: ".overview .inner",
                    scrub: 1,
                    end: "=+200%",
                    pin: true,
                    duration:1,
                    onLeave: function(){
                        symbol.classList.add("hide");
                        symbolGif.classList.add("active");
                        symbolGif.src = "./assets/images/icon/ai_symbol.gif";
                    },
                    onEnterBack: function(){
                        symbol.classList.remove("hide");
                        symbolGif.classList.remove("active");
                        symbolGif.src = "./assets/images/icon/ai_symbol.png";
                    },
                }
            });

            heroVisual1.addLabel('fadein')
                .to(symbol, {
                    opacity: 1,
                })
                .to(symbol, {
                    width: "7rem",
                    filter: "blur(10px)",
                })
                .addLabel('logoChange')
                .to(symbol, {
                    width: "4.5rem",
                    filter: "blur(0px)",
                    transform: "translate(-50%, 0)",
                    marginTop: "4.5rem",
                },'logoChange')
                .to(secOverflow, {
                    overflow: "unset"
                },'logoChange');
            },
            
        // 모바일용 스크롤 트리거
        "(max-width: 1024px)": function() {
            const symbolGif = document.querySelector('.logo-wrap.gif-bx .gif');
            symbolGif.src = "./assets/images/icon/ai_symbol.gif";
        },
    });
    
    const contentBoxes = document.querySelectorAll(".content-bx");
    // 이벤트 리스너 설정
    contentBoxes.forEach((box) => {
        const video = box.querySelector("video");
        // 마우스 오버 이벤트
        box.addEventListener("mouseenter", function () {
            if (window.innerWidth > 1025) { // PC 모드일 때만
                video.setAttribute("autoplay", "autoplay");
                video.play();
            }
        });
        // 마우스 아웃 이벤트
        box.addEventListener("mouseleave", function () {
            if (window.innerWidth > 1025) { // PC 모드일 때만
                video.removeAttribute("autoplay");
                video.pause();
                video.currentTime = 0;
                video.load();
            }
        });
    });

    // 화면 크기에 따른 비디오 변경
    function switchVideo() {
        const isPC = window.innerWidth >= 1025;

        contentBoxes.forEach((box) => {
            const video = box.querySelector("video");
            const pcSrc = video.getAttribute("data-pc-video");
            const mSrc = video.getAttribute("data-m-video");

            // PC와 Mobile 데이터 적용
            if (isPC && pcSrc) {
                video.querySelector("source").setAttribute("src", pcSrc);
                video.removeAttribute("autoplay"); // PC에서는 autoplay 비활성화
            } else if (!isPC && mSrc) {
                video.querySelector("source").setAttribute("src", mSrc);
                video.setAttribute("autoplay", "autoplay"); // Mobile에서는 autoplay 활성화
                video.play().catch((error) => {
                    console.warn("Video playback failed:", error);
                });
            }

            video.load(); // 비디오 소스를 새로 로드
        });
    };

    // 이전 가로 크기를 저장
    let previousWidth = window.innerWidth;

    // 초기 로드 및 화면 크기 변경 이벤트
    switchVideo();
    window.addEventListener("resize", () => {
        const currentWidth = window.innerWidth;

        // 가로 크기가 변경된 경우에만 switchVideo 호출
        if (currentWidth !== previousWidth) {
            previousWidth = currentWidth;
            switchVideo();
        }
    });

    const fillTxt = document.querySelector('.lifesgood .txt-bx .title');
    // 자식 노드 순회하며 <span> 태그로 감싸기
    const wrappedText = Array.from(fillTxt.childNodes).map(node => {
        if (node.nodeType === Node.TEXT_NODE) {
            // 텍스트 노드의 내용을 글자 단위로 <span> 감싸기
            return node.textContent
                .split('')
                .map(char => `<span tabindex="-1" aria-hidden="true">${char}</span>`)
                .join('');
        } else if (node.nodeType === Node.ELEMENT_NODE && node.tagName === 'BR') {
            // <br> 태그는 그대로 유지
            return '<br>';
        }
        return ''; // 기타 노드는 무시
    }).join('');

    // HTML 내용으로 다시 삽입
    fillTxt.innerHTML = wrappedText;

    window.addEventListener("scroll", function() {
        const target = document.querySelector('.section.lifesgood');
        const targetPosition = target.offsetTop; // 요소의 페이지에서의 위치
        const targetHeight = target.offsetHeight; // 요소의 높이
        // 현재 스크롤 위치가 target 요소의 영역에 들어갔을 때
        if (window.scrollY + window.innerHeight / 2 > targetPosition && window.scrollY < targetPosition + targetHeight) {
            target.classList.add('active'); // 활성화 클래스 추가
        } else {
            target.classList.remove('active'); // 활성화 클래스 추가
        }
    });

    /* storySlide 슬라이드 */
    let storySlide = null;
    function handleResize() {
        let isMobileView = window.innerWidth <= 1025;
        if (isMobileView && !storySlide) {
            storySlide = new Swiper(".stories .swiper", {
                slidesPerView: 1.2,
                spaceBetween: 10,
                speed: 1000,
                navigation: {
                    nextEl: ".stories .slide-button-next",
                    prevEl: ".stories .slide-button-prev",
                },
                a11y: {
                    nextSlideMessage: 'move to next slide',
                    prevSlideMessage: 'move to prev slide',
                },
            });
        }
        else if (!isMobileView && storySlide) {
            // 1025px 초과일 때 슬라이드 제거
            storySlide.destroy();
            storySlide = null;
        }
    }
    handleResize();
    window.addEventListener("resize", handleResize);
});