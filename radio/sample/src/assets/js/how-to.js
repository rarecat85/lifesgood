function howTo() {
  
  howToVideoSlide = new Swiper(".how-to-video-slide", {
    slidesPerView: 1,
    spaceBetween: 16,
    speed: 700,
    slideToClickedSlide: true,
    centeredSlides: true,
    mousewheel: {
      forceToAxis: true, // 이 옵션이 핵심입니다.
    },
    pagination: {
      el: ".how-to-video-slide .swiper-pagination",
      clickable: true,
    },
    navigation: {
      nextEl: ".how-to-video-slide .swiper-button-next",
      prevEl: ".how-to-video-slide .swiper-button-prev",
    },
    breakpoints: {
      1441: {
        slidesPerView: 1.6,
        spaceBetween: 24,
      },
    },
    on: {
      init: function() {
        const videos = document.querySelectorAll('.how-to-video-bx video');
        const bullets = document.querySelectorAll('.how-to-video-slide .swiper-pagination .swiper-pagination-bullet');
        let loadedCount = 0;
        
        // 모든 비디오의 메타데이터가 로드될 때까지 기다림
        videos.forEach((video, index) => {
          video.addEventListener('loadedmetadata', function() {
            loadedCount++;
            console.log(`Video ${index + 1} Duration:`, video.duration);
            
            // 해당 pagination bullet에 transition-duration 적용
            if (bullets[index]) {
              bullets[index].style.setProperty('--bullet-duration', `${video.duration}s`);
              console.log(`Applied --bullet-duration: ${video.duration}s to bullet ${index + 1}`);
            }
            
            // 모든 비디오가 로드되면 첫 번째 비디오 재생
            if (loadedCount === videos.length) {  
              const activeIndex = this.activeIndex || 0;
              if (videos[activeIndex]) {
                videos[activeIndex].play();
              }
            }
          });
        });
      },
      slideChange: function() {
        const activeIndex = this.activeIndex;
        const videos = document.querySelectorAll('.how-to-video-bx video');
        
        // 모든 비디오 정지
        videos.forEach(video => {
          video.pause();
          video.currentTime = 0;
        });
        
        // 현재 활성 비디오 재생
        if (videos[activeIndex]) {
          videos[activeIndex].play();
        }
      }
    }
  });

  howToTxtSlide = new Swiper(".how-to-txt-slide", {
    effect: 'fade',
    fadeEffect: {
      crossFade: true,
    },
    slidesPerView: 1,
    spaceBetween: 16,
    autoHeight: true,
  });

  howToVideoSlide.controller.control = howToTxtSlide;
  howToTxtSlide.controller.control = howToVideoSlide;

  const videoControlBtns = document.querySelectorAll('.how-to-video-control-btn');
  videoControlBtns.forEach(btn => {
    const video = btn.closest('.how-to-video-bx').querySelector('video');
    
    // 비디오 컨트롤 버튼 클릭 이벤트
    btn.addEventListener('click', () => {
      if (video.ended) {
        // 비디오가 끝난 상태에서 클릭하면 restart
        video.currentTime = 0;
        video.play();
        btn.classList.remove('restart');
        btn.classList.add('pause');
        btn.setAttribute('aria-label', 'pause');
        btn.querySelector('.sr-only').textContent = 'Pause';
      } else if (video.paused) {
        // 일시정지 상태에서 클릭하면 재생
        video.play();
        btn.classList.remove('play');
        btn.classList.add('pause');
        btn.setAttribute('aria-label', 'pause');
        btn.querySelector('.sr-only').textContent = 'Pause';
      } else {
        // 재생 중에 클릭하면 일시정지
        video.pause();
        btn.classList.remove('pause');
        btn.classList.add('play');
        btn.setAttribute('aria-label', 'play');
        btn.querySelector('.sr-only').textContent = 'Play';
      }
    });
    
    // 비디오 재생 시작 시 버튼 상태 변경
    video.addEventListener('play', () => {
      btn.classList.remove('play', 'restart');
      btn.classList.add('pause');
      btn.setAttribute('aria-label', 'pause');
      btn.querySelector('.sr-only').textContent = 'Pause';
    });
    
    // 비디오 일시정지 시 버튼 상태 변경
    video.addEventListener('pause', () => {
      if (!video.ended) {
        btn.classList.remove('pause', 'restart');
        btn.classList.add('play');
        btn.setAttribute('aria-label', 'play');
        btn.querySelector('.sr-only').textContent = 'Play';
      }
    });
    
    // 비디오 종료 시 restart 버튼으로 변경
    video.addEventListener('ended', () => {
      btn.classList.remove('play', 'pause');
      btn.classList.add('restart');
      btn.setAttribute('aria-label', 'restart');
      btn.querySelector('.sr-only').textContent = 'Restart';
    });
  });
} 

howTo();