function soundTitleAnimation() {
    const title = document.querySelector(".sound-txtbx-title");
    const titleWrapper = document.querySelector(".sound-txtbx-title-wrapper");

    const titlerWidth = title.clientWidth;
    const titleWrapperWidth = titleWrapper.scrollWidth;

    const distance = titlerWidth + titleWrapperWidth;

    const speed = 100;
    const duration = distance / speed;

    gsap.to(titleWrapper, {
        x: -distance,
        ease: "none",
        duration: duration,
        repeat: true,
        repeatDelay: 0,
    });
}

const soundSwiper = document.querySelector(".sound .sound-swiper");

if (soundSwiper) {
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
                soundTitleAnimation();
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
                    soundTitleAnimation();
                }
            }
        },
        breakpoints: {
            769: {
                slidesPerView: 1.2,
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