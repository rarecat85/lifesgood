const soundSwiper = document.querySelector(".sound .sound-swiper");

if (soundSwiper) {
    const soundAlbums = document.querySelectorAll(".sound .swiper-slide .sound-imgbx-album");
    const soundTracks = document.querySelectorAll(".sound .swiper-slide .sound-imgbx-track");
    const soundTexts = document.querySelectorAll(".sound .swiper-slide .sound-txtbx");

    const swiperOptions = {
        slidesPerView: 1.2,
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
                soundAlbums[0].classList.add("active");
                soundTracks[0].classList.add("active");
                soundTexts[0].classList.add("active");
            },
            slideChange: function () {
                const index_currentSlide = this.realIndex;
                const currentSlide = this.slides[index_currentSlide];

                soundAlbums.forEach(el => el.classList.remove("active"));
                soundTracks.forEach(el => el.classList.remove("active"));
                soundTexts.forEach(el => el.classList.remove("active"));

                if (currentSlide) {
                    soundAlbums[index_currentSlide].classList.add("active");
                    soundTracks[index_currentSlide].classList.add("active");
                    soundTexts[index_currentSlide].classList.add("active");
                }
            }
        },
        breakpoints: {
            768: {
                slidesPerView: 2.34,
                spaceBetween: 80,
            },
            1441: {
                slidesPerView: 2.5,
                spaceBetween: 122,
            }
        },
    }

    const swiperInstance = new Swiper(soundSwiper, swiperOptions);
}