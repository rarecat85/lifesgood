const soundSwiper = document.querySelector(".sound .sound-swiper");
const trackTimelines = {};
const trackStarted = {};

if (soundSwiper) {
    // 미디어 쿼리 설정
    const mediaQueries = {
        tablet: window.matchMedia("(min-width: 769px) and (max-width: 1440px)"),
        desktop: window.matchMedia("(min-width: 1441px)")
    };

    // 디바이스별 간격 업데이트 함수
    function updateExtraPadding() {
        const swiperWrapper = document.querySelector(".sound .swiper-wrapper");

        if (mediaQueries.tablet.matches) {
            // 태블릿 추가 간격
            swiperWrapper.style.paddingLeft = "110px";
        } else if (mediaQueries.desktop.matches) {
            // 데스크탑 추가 간격
            swiperWrapper.style.paddingLeft = "150px";
        } else {
            // 모바일 초기화
            resetExtraPadding();
        }
    }

    // 디바이스별 간격 업데이트 함수 - 초기화
    function resetExtraPadding() {
        const swiperWrapper = document.querySelector(".sound .swiper-wrapper");
        swiperWrapper.style.paddingLeft = "0px";
    }

    const audioControllerBtns = document.querySelectorAll(".sound-txtbx-controllers-btn");
    const progressFills = document.querySelectorAll(".progress-fill");
    const progressCircles = document.querySelectorAll(".progress-circle");

    // 초기화 함수(슬라이드 변경시)
    function resetAll() {
        const audios = document.querySelectorAll("audio");

        audios.forEach(audio => {
            audio.pause();
            audio.currentTime = 0;
        });

        // 타임라인 초기화 
        Object.values(trackTimelines).forEach(tl => {
            tl.pause();
            tl.timeScale(0);
        });

        // 컨트롤러 버튼 초기화 
        audioControllerBtns.forEach(btn => {
            btn.setAttribute("aria-pressed", "false");
            btn.setAttribute("aria-label", "play");
        });

        // 컨트롤러 프로그래스바 초기화 
        progressFills.forEach(fill => fill.style.width = "0%");
        progressCircles.forEach(circle => circle.style.left = "0%");
    }

    // 오디오 컨트롤러 함수 
    function handleAudio() {
        const controllers = document.querySelectorAll(".sound-txtbx-controllers[role='group']");

        controllers.forEach((group, idx) => {
            const audioControllerBtn = group.querySelector(".sound-txtbx-controllers-btn");
            const progressBar = group.querySelector(".progress-bar");
            const progressCricle = group.querySelector(".progress-circle");
            const volumeBtn = group.querySelector(".volume-btn");
            const audioId = audioControllerBtn.getAttribute("aria-controls");
            const audio = document.getElementById(audioId);
            // const volumeSlider = group.querySelector(".volume-slider");
            // volumeSlider.value = audio.volume.toString();

            // 초기화
            audio.pause();
            audio.muted = false;
            audioControllerBtn.setAttribute("aria-pressed", "false");
            audioControllerBtn.setAttribute("aria-label", "play");
            volumeBtn.setAttribute("aria-pressed", "false");
            volumeBtn.setAttribute("aria-label", "mute");
            progressCricle.setAttribute("aria-valuemin", "0");
            progressCricle.setAttribute("aria-valuemax", "100");
            progressCricle.setAttribute("aria-valuenow", "0");
            progressCricle.setAttribute("aria-valuetext", "0%");

            // 컨트롤러 버튼 클릭 이벤트
            audioControllerBtn.addEventListener("click", () => {
                if (audio.paused) {
                    audio.play().catch(() => {});
                    audioControllerBtn.setAttribute("aria-pressed", "true");
                    audioControllerBtn.setAttribute("aria-label", "pause");
                    soundTrackAnimation(idx, false);
                } else {
                    audio.pause();
                    audioControllerBtn.setAttribute("aria-pressed", "false");
                    audioControllerBtn.setAttribute("aria-label", "play");
                    soundTrackAnimation(idx, true);

                }
            });

            // 오디오 타임라인 업데이트 이벤트
            audio.addEventListener("timeupdate", () => {
                const percentage = (audio.currentTime / audio.duration) * 100;

                progressCricle.style.left = percentage + "%";

                const fill = group.querySelector(".progress-fill");
                fill.style.width = percentage + "%";

                progressCricle.setAttribute("aria-valuenow", Math.floor(percentage));
                progressCricle.setAttribute("aria-valuetext", `${Math.floor(percentage)}%`);

                if (percentage >= 100) {
                    audioControllerBtn.setAttribute("aria-pressed", "false");
                    audioControllerBtn.setAttribute("aria-label", "play");
                    soundTrackAnimation(idx, true);
                }
            });

            // 프로그래스바 클릭 이벤트(오디오 시간대 변경)
            progressBar.addEventListener("click", e => {
                const rect = progressBar.getBoundingClientRect();
                const clickX = e.clientX - rect.left;
                const percentage = clickX / rect.width;
                audio.currentTime = percentage * audio.duration;
            });

            // 볼륨 슬라이더 이벤트
            // volumeSlider.addEventListener("pointerdown", e => e.stopPropagation());
            // volumeSlider.addEventListener("click", e => e.stopPropagation());

            // volumeSlider.addEventListener("input", e => {
            //     const vol = parseFloat(e.target.value);
            //     audio.volume = vol;

            //     if (vol > 0) {
            //         audio.muted = false;
            //     }
            // });

            // 뮤트/언뮤트 클릭 이벤트
            volumeBtn.addEventListener("click", () => {
                audio.muted = !audio.muted;
                const muted = audio.muted;
                volumeBtn.setAttribute("aria-pressed", muted.toString());
                volumeBtn.setAttribute("aria-label", muted ? "unmute" : "mute");
            });
        });
    }

    // LP 회전 함수
    function soundTrackAnimation(index = 0, isStopped = false) {
        const tracks = document.querySelectorAll(".sound-imgbx-track");
        const track = tracks[index];

        console.log(trackTimelines[index])

        // 현재 슬라이드 타임라인 
        if (!trackTimelines[index]) {
            const tl = gsap.timeline({
                    paused: true,
                    repeat: -1,
                })
                .to(track, {
                    rotation: "+=360",
                    duration: 2,
                    ease: "none"
                });
            tl.timeScale(0);
            trackTimelines[index] = tl;
        }
        const tl = trackTimelines[index];

        // 오디오 길이 계산
        const playBtn = document.querySelectorAll(".sound-txtbx-controllers-btn")[index];
        const audio = document.getElementById(playBtn.getAttribute("aria-controls"));
        const accel = 2; // 가속 
        const decel = 2; // 감속 
        const total = audio.duration || accel + decel;
        const delay = Math.max(0, total - decel);

        // 재생 버튼을 눌렀다면 
        if (!isStopped) {
            if (!trackStarted[index]) {
                trackStarted[index] = true;

                tl.play();

                gsap.to(tl, {
                    timeScale: 1,
                    duration: decel,
                    ease: "power2.in"
                });

                gsap.to(tl, {
                    timeScale: 0,
                    duration: accel,
                    delay: delay,
                    ease: "power2.out",
                    onComplete: () => tl.pause()
                });
            } else {
                tl.play();
            }
            // 정지 버튼을 눌렀다면
        } else {
            tl.pause();
        }
    }

    // 타이틀 애니메이션 함수(기본값 첫번째 슬라이드)
    function soundTitleAnimation(index = 0) {
        const titleWrappers = document.querySelectorAll(".sound-txtbx-title-wrapper");
        const CopiedtitleWrapper = titleWrappers[index];

        // 텍스트 복제
        const originalText = CopiedtitleWrapper.innerHTML;
        CopiedtitleWrapper.innerHTML = originalText + originalText;

        // 텍스트 이동거리 계산
        const textDistanceWidth = CopiedtitleWrapper.scrollWidth / 2;

        // 텍스트 이동속도 설정
        const speed = 100;
        const duration = textDistanceWidth / speed;

        gsap.fromTo(CopiedtitleWrapper, {
            x: 0
        }, {
            x: -textDistanceWidth,
            ease: "none",
            duration: duration,
            repeat: -1,
            repeatDelay: 0
        });
    }

    // 슬라이드 화살표 위치 조정 함수(앨범 높이의 중앙 위치하도록)
    function moveCenterNavigation() {
        const soundSwiper = document.querySelector('.sound-swiper');
        const swiperNavigation = document.querySelector(".sound .swiper-navigation");
        const album = document.querySelector('.swiper-slide-active .sound-imgbx-album');

        const navigationPosition = (album.getBoundingClientRect().top - soundSwiper.getBoundingClientRect().top) + (album.getBoundingClientRect().height / 2);

        swiperNavigation.style.top = `${navigationPosition}px `;
    }

    const imgbxs = document.querySelectorAll(".sound .swiper-slide .sound-imgbx");
    const soundAlbums = document.querySelectorAll(".sound .swiper-slide .sound-imgbx-album");
    const soundTracks = document.querySelectorAll(".sound .swiper-slide .sound-imgbx-track");
    const soundTexts = document.querySelectorAll(".sound .swiper-slide .sound-txtbx");

    const swiperOptions = {
        slidesPerView: 1,
        centeredSlides: true,
        slideToClickedSlide: true,
        mousewheel: {
            forceToAxis: true,
        },
        pagination: {
            el: ".sound .swiper-pagination",
            clickable: true,
        },
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
        touchable: true,
        on: {
            init: function () {
                imgbxs[0].classList.add("active");
                soundAlbums[0].classList.add("active");
                soundTracks[0].classList.add("active");
                soundTexts[0].classList.add("active");
                soundTitleAnimation(0);
                moveCenterNavigation();
                handleAudio();
            },
            slideChange: function () {
                const index_currentSlide = this.realIndex;
                const currentSlide = this.slides[index_currentSlide];

                imgbxs.forEach(el => el.classList.remove("active"));
                soundAlbums.forEach(el => el.classList.remove("active"));
                soundTracks.forEach(el => el.classList.remove("active"));
                soundTexts.forEach(el => el.classList.remove("active"));

                if (currentSlide) {
                    resetAll();

                    if (trackTimelines[this.realIndex]) {
                        trackTimelines[this.realIndex].kill();
                        delete trackTimelines[this.realIndex];
                        trackStarted[this.realIndex] = false;
                    }

                    imgbxs[index_currentSlide].classList.add("active");
                    soundAlbums[index_currentSlide].classList.add("active");
                    soundTracks[index_currentSlide].classList.add("active");
                    soundTexts[index_currentSlide].classList.add("active");
                    soundTitleAnimation(index_currentSlide);
                }

                if (this.realIndex === 1) {
                    updateExtraPadding();
                } else if (this.realIndex === 0) {
                    resetExtraPadding();
                }
            }
        },
        breakpoints: {
            769: {
                slidesPerView: 'auto',
                spaceBetween: 100,
                centeredSlides: true,
            },
            1441: {
                slidesPerView: 'auto',
                spaceBetween: 122,
                centeredSlides: true,
            }
        },
    }

    const swiperInstance = new Swiper(soundSwiper, swiperOptions);

    function handleResize() {
        moveCenterNavigation();
    }

    function debounce(func, delay = 500) {
        let timer;
        return function (...args) {
            if (timer) clearTimeout(timer);
            timer = setTimeout(() => func.apply(this, args), delay);
        }
    }

    function initSound() {
        moveCenterNavigation();
        window.addEventListener('resize', debounce(handleResize));
    }

    initSound();
}