    const controllerBtn = document.querySelector(".sound-txtbx-controllers-btn");

    controllerBtn.addEventListener("click", function () {
        const isStopped = controllerBtn.getAttribute('aria-pressed');

        console.log(isStopped);

        if (isStopped === 'true') {
            controllerBtn.setAttribute('aria-label', 'play');
            controllerBtn.setAttribute('aria-pressed', 'false');

            // GSAP LP 회전 시작
            soundTrackAnimation(0, false)
        } else {
            controllerBtn.setAttribute('aria-label', 'pause');
            controllerBtn.setAttribute('aria-pressed', 'true');

            // GSAP LP 회전 정지
            soundTrackAnimation(0, true)
        }
    });

    function soundTrackAnimation(index = 0, isStop = false) {
        const track = document.querySelectorAll(".sound-imgbx-track");

        trackInstance = gsap.to(track[index], {
            rotation: 360, // 1분에 몇 도 회전하는지..? 
            ease: "power3.inOut",
            // 추후 repeat 제거 / duration(mp3 시간 분량으로)
            duration: 30,
            repeat: -1,
            repeatDelay: 0,
        });

        if (isStop && trackInstance) {
            trackInstance.pause();
        }
    }

    let trackInstance = null;

    const soundSwiper = document.querySelector(".sound .sound-swiper");

    if (soundSwiper) {
        // soundTitleAnimation();
        function soundTitleAnimation(index = 0) {

            const title = document.querySelectorAll(".sound-txtbx-title");
            const titleWrapper = document.querySelectorAll(".sound-txtbx-title-wrapper");

            const titlerWidth = title[index].clientWidth;
            const titleWrapperWidth = titleWrapper[index].scrollWidth;

            const distance = titlerWidth + titleWrapperWidth;

            const speed = 100;
            const duration = distance / speed;

            gsap.to(titleWrapper[index], {
                x: -distance,
                ease: "none",
                duration: duration,
                repeat: -1,
                repeatDelay: 0,
            });
        }

        const imgbxs = document.querySelectorAll(".sound .swiper-slide .sound-imgbx");
        const soundAlbums = document.querySelectorAll(".sound .swiper-slide .sound-imgbx-album");
        const soundTracks = document.querySelectorAll(".sound .swiper-slide .sound-imgbx-track");
        const soundTexts = document.querySelectorAll(".sound .swiper-slide .sound-txtbx");

        const swiperOptions = {
            slidesPerView: 1,
            spaceBetween: 16,
            pagination: {
                el: ".sound-swiper-controller .swiper-pagination",
                clickable: true,
            },
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            touchable: true,
            // loop: true,
            on: {
                init: function () {
                    imgbxs[0].classList.add("active");
                    soundAlbums[0].classList.add("active");
                    soundTracks[0].classList.add("active");
                    soundTexts[0].classList.add("active");
                    soundTitleAnimation(0);
                },
                slideChange: function () {
                    const index_currentSlide = this.realIndex;
                    const currentSlide = this.slides[index_currentSlide];

                    imgbxs.forEach(el => el.classList.remove("active"));
                    soundAlbums.forEach(el => el.classList.remove("active"));
                    soundTracks.forEach(el => el.classList.remove("active"));
                    soundTexts.forEach(el => el.classList.remove("active"));


                    if (currentSlide) {
                        imgbxs[index_currentSlide].classList.add("active");
                        soundAlbums[index_currentSlide].classList.add("active");
                        soundTracks[index_currentSlide].classList.add("active");
                        soundTexts[index_currentSlide].classList.add("active");
                        soundTitleAnimation(index_currentSlide);
                    }
                }
            },
            breakpoints: {
                769: {
                    slidesPerView: 2.2,
                    centeredSlides: true,
                    // spaceBetween: 100,
                },
                1441: {
                    slidesPerView: 3.5,
                    centeredSlides: true,
                    // spaceBetween: 122,
                }
            },
        }

        const swiperInstance = new Swiper(soundSwiper, swiperOptions);
    }