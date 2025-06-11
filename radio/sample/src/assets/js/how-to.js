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
        const controlBtns = document.querySelectorAll('.how-to-video-control-btn');
        let loadedCount = 0;
        
        // 모든 비디오의 메타데이터가 로드될 때까지 기다림
        videos.forEach((video, index) => {
          video.addEventListener('loadedmetadata', function() {
            loadedCount++;
            console.log(`Video ${index + 1} Duration:`, video.duration);
            
            // 해당 컨트롤 버튼에 progress duration 설정
            if (controlBtns[index]) {
              controlBtns[index].style.setProperty('--progress-duration', `${video.duration}s`);
              console.log(`Applied --progress-duration: ${video.duration}s to control button ${index + 1}`);
            }
            
            // 모든 비디오가 로드되면 첫 번째 비디오 재생
            if (loadedCount === videos.length) {  
              const activeIndex = this.activeIndex || 0;
              if (videos[activeIndex]) {
                // 재생 시도 전 확인
                const playPromise = videos[activeIndex].play();
                if (playPromise !== undefined) {
                  playPromise.then(() => {
                    console.log('Video playback started successfully');
                    // 첫 번째 컨트롤 버튼의 progress 시작
                    const progressCircle = controlBtns[activeIndex]?.querySelector('.progress-circle-fill');
                    if (progressCircle) {
                      const duration = videos[activeIndex].duration;
                      console.log(`Setting initial progress animation duration: ${duration}s`);
                      // CSS animation 시작
                      progressCircle.classList.add('progress-active');
                    }
                  }).catch(error => {
                    console.log('Auto-play prevented:', error);
                    // 자동재생이 차단된 경우 사용자 상호작용 대기
                  });
                }
              }
            }
          });
          
          // 비디오 로드 에러 처리
          video.addEventListener('error', function(e) {
            console.error(`Video ${index + 1} load error:`, e);
          });
          
          // 비디오 로드 시작
          video.load();
        });
      },
      slideChange: function() {
        const activeIndex = this.activeIndex;
        const videos = document.querySelectorAll('.how-to-video-bx video');
        const controlBtns = document.querySelectorAll('.how-to-video-control-btn');
        
        // 모든 비디오 정지 및 progress 리셋
        videos.forEach((video, index) => {
          video.pause();
          video.currentTime = 0;
          
          // progress circle 리셋
          const progressCircle = controlBtns[index]?.querySelector('.progress-circle-fill');
          if (progressCircle) {
            progressCircle.classList.remove('progress-active', 'progress-completed', 'progress-paused');
            progressCircle.classList.add('progress-reset');
          }
        });
        
        // 현재 활성 비디오 재생
        if (videos[activeIndex]) {
          const playPromise = videos[activeIndex].play();
          if (playPromise !== undefined) {
            playPromise.then(() => {
              // 현재 활성 컨트롤 버튼의 progress 시작
              const activeProgressCircle = controlBtns[activeIndex]?.querySelector('.progress-circle-fill');
              if (activeProgressCircle) {
                setTimeout(() => {
                  const duration = videos[activeIndex].duration;
                  console.log(`Setting slide change progress animation duration: ${duration}s`);
                  // CSS animation 시작
                  activeProgressCircle.classList.remove('progress-reset');
                  activeProgressCircle.classList.add('progress-active');
                }, 50);
              }
            }).catch(error => {
              console.log('Auto-play prevented on slide change:', error);
            });
          }
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
    const progressCircle = btn.querySelector('.progress-circle-fill');
    
    // 비디오 컨트롤 버튼 클릭 이벤트
    btn.addEventListener('click', () => {
      if (video.ended) {
        // 비디오가 끝난 상태에서 클릭하면 restart
        video.currentTime = 0;
        btn.classList.remove('restart');
        btn.classList.add('pause');
        btn.setAttribute('aria-label', 'pause');
        btn.querySelector('.sr-only').textContent = 'Pause';
        // progress 재시작 - CSS 변수와 클래스 활용
        if (progressCircle) {
          // 리셋 후 애니메이션 시작
          progressCircle.classList.remove('progress-active', 'progress-completed', 'progress-paused');
          progressCircle.classList.add('progress-reset');
          
          setTimeout(() => {
            progressCircle.classList.remove('progress-reset');
            progressCircle.classList.add('progress-active');
          }, 50);
        }
        // 비디오 재생은 약간의 지연 후 시작
        setTimeout(() => {
          video.play();
        }, 10);
      } else if (video.paused) {
        // 일시정지 상태에서 클릭하면 현재 지점에서 재생
        video.play();
        btn.classList.remove('play');
        btn.classList.add('pause');
        btn.setAttribute('aria-label', 'pause');
        btn.querySelector('.sr-only').textContent = 'Pause';
        // progress 재개 - animation-play-state를 running으로 변경
        if (progressCircle) {
          console.log('Resuming animation with play-state: running');
          progressCircle.classList.remove('progress-paused');
          progressCircle.classList.add('progress-active');
        }
      } else {
        // 재생 중에 클릭하면 일시정지
        video.pause();
        btn.classList.remove('pause');
        btn.classList.add('play');
        btn.setAttribute('aria-label', 'play');
        btn.querySelector('.sr-only').textContent = 'Play';
        // progress 일시정지 - animation-play-state를 paused로 변경
        if (progressCircle) {
          console.log('Pausing animation with play-state: paused');
          progressCircle.classList.remove('progress-active');
          progressCircle.classList.add('progress-paused');
        }
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
      // progress 완료 상태로 유지
      if (progressCircle) {
        progressCircle.classList.remove('progress-active');
        progressCircle.classList.add('progress-completed');
      }
    });
  });
} 

howTo();