function influence() {
  let currentPlayingVideo = null; // 현재 재생 중인 비디오 추적
  let influenceSlide; // Swiper 인스턴스를 위한 변수를 상단에 선언
  
  // 디바이스별 간격 설정
  let extraPadding = 0;
  
  // 미디어 쿼리 설정
  const mediaQueries = {
    mobile: window.matchMedia("(max-width: 767px)"),
    tablet: window.matchMedia("(min-width: 768px) and (max-width: 1023px)"),
    desktop: window.matchMedia("(min-width: 1024px)")
  };
  
  // 디바이스별 간격 업데이트 함수
  function updateExtraPadding() {
    if (mediaQueries.mobile.matches) {
      extraPadding = 8; // 모바일 추가 간격
    } else if (mediaQueries.tablet.matches) {
      extraPadding = 8; // 태블릿 추가 간격
    } else {
      extraPadding = 16; // 데스크탑 추가 간격
    }
  }
  
  // 초기 간격 설정
  updateExtraPadding();
  
  // 활성화된 슬라이드의 bottom 값 업데이트 함수
  function updateActiveSlideBottom() {
    // influenceSlide가 초기화되지 않았으면 함수 실행 중단
    if (!influenceSlide || influenceSlide.activeIndex === undefined) return;
    
    const activeIndex = influenceSlide.activeIndex;
    
    // 모든 content-bx의 bottom 값 초기화
    document.querySelectorAll('.influence-content-bx').forEach(contentBx => {
      contentBx.style.bottom = '0';
    });
    
    const activeContentBx = document.querySelectorAll('.influence-content-bx')[activeIndex];
    const activeTxtBx = document.querySelectorAll('.influence-txt-bx')[activeIndex];
    
    if (activeContentBx && activeTxtBx) {
      // 활성화된 슬라이드의 content-bx에 txt-bx 높이 + 추가 간격만큼 bottom 값 적용
      activeContentBx.style.bottom = `${(activeTxtBx.clientHeight + extraPadding) / 16}rem`;
    }
  }
  
  // Swiper 초기화
  influenceSlide = new Swiper(".influence-slide", {
    slidesPerView: 1.4,
    slidesPerGroup: 1,
    spaceBetween: 16,
    speed: 700,
    slideToClickedSlide: true,
    centeredSlides: true,
    loop: true,
    loopedSlides: 5,
    mousewheel: {
      forceToAxis: true, // 이 옵션이 핵심입니다.
    },
    pagination: {
      el: ".influence-slide .swiper-pagination",
      clickable: true,
    },
    navigation: {
      nextEl: ".influence-slide .swiper-button-next",
      prevEl: ".influence-slide .swiper-button-prev",
    },
    breakpoints: {
      768: {
        slidesPerView: 3,
        spaceBetween: 23.36,
      },
      1440: {
        slidesPerView: 4.7,
        spaceBetween: 48,
      },
    },
    on: {
      init: function() {
        // 초기 로드 시 활성화된 슬라이드의 비디오 재생
        const activeIndex = this.activeIndex;
        const activeContentBx = document.querySelectorAll('.influence-content-bx')[activeIndex];
        const activeVideo = activeContentBx ? activeContentBx.querySelector('video') : null;
        
        // 활성화된 슬라이드의 bottom 값 설정
        updateActiveSlideBottom();

        if (activeVideo) {
          activeVideo.muted = true; // 기본값으로 mute 설정
          activeVideo.play();
          currentPlayingVideo = activeVideo;
          
          // 비디오 종료 시 다음 슬라이드로 이동하는 이벤트 리스너 추가
          activeVideo.addEventListener('ended', () => {
            influenceSlide.slideNext();
          });
          
          // 초기 활성화 슬라이드의 사운드 버튼 상태를 mute 상태로 업데이트
          const activeSoundBtn = activeContentBx.querySelector('.influence-content-bx-sound-btn');
          const activeSoundBtnImg = activeSoundBtn.querySelector('img');
          
          if (activeSoundBtn && activeSoundBtnImg) {
            activeSoundBtnImg.src = './assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-influence-unmute-icon.svg';
            activeSoundBtnImg.setAttribute('alt', 'sound on');
            activeSoundBtn.setAttribute('aria-label', 'sound on');
            activeSoundBtn.setAttribute('aria-pressed', 'false');
          }
        }
      },
      slideChange: function() {
        // 활성화된 슬라이드 인덱스
        const activeIndex = this.activeIndex;
        const newActiveContentBx = document.querySelectorAll('.influence-content-bx')[activeIndex];
        const newActiveVideo = newActiveContentBx ? newActiveContentBx.querySelector('video') : null;
        
        // 활성화된 슬라이드의 bottom 값 업데이트
        updateActiveSlideBottom();
        
        // 현재 재생 중인 비디오가 있으면 정지 및 초기화
        if (currentPlayingVideo && currentPlayingVideo !== newActiveVideo) {
          currentPlayingVideo.pause();
          currentPlayingVideo.currentTime = 0;
        }
        
        // 새로운 활성화 비디오 재생 및 mute 상태로 설정
        if (newActiveVideo) {
          newActiveVideo.muted = true; // 기본값으로 mute 설정
          newActiveVideo.play();
          currentPlayingVideo = newActiveVideo;
          
          // 비디오 종료 시 다음 슬라이드로 이동하는 이벤트 리스너 추가
          newActiveVideo.addEventListener('ended', () => {
            influenceSlide.slideNext();
          });
          
          // 새로운 활성화 슬라이드의 사운드 버튼 상태를 mute 상태로 업데이트
          const newActiveSoundBtn = newActiveContentBx.querySelector('.influence-content-bx-sound-btn');
          const newActiveSoundBtnImg = newActiveSoundBtn.querySelector('img');
          
          if (newActiveSoundBtn && newActiveSoundBtnImg) {
            newActiveSoundBtnImg.src = './assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-influence-unmute-icon.svg';
            newActiveSoundBtnImg.setAttribute('alt', 'sound on');
            newActiveSoundBtn.setAttribute('aria-label', 'sound on');
            newActiveSoundBtn.setAttribute('aria-pressed', 'false');
          }
        }
      },
      resize: function() {
        // 창 크기 변경 시 활성화된 슬라이드의 bottom 값 업데이트
        updateActiveSlideBottom();
      }
    }
  });
  
  // 미디어 쿼리 변경 리스너 등록 - Swiper 초기화 후에 실행
  Object.values(mediaQueries).forEach(query => {
    query.addEventListener('change', () => {
      updateExtraPadding();
      updateActiveSlideBottom();
    });
  });

  function toggleVideo(video) {
    // 반복되는 DOM 요소 선택을 변수로 저장
    const videoBox = video.closest('.influence-content-bx');
    const button = videoBox.querySelector('.influence-content-bx-play-btn');
    const buttonImg = button.querySelector('img');
    
    if (video.paused) {
      video.play();
      // 버튼 이미지를 일시정지 아이콘으로 변경
      buttonImg.src = './assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-influence-slide-pause.svg';
      buttonImg.setAttribute('alt', 'pause video');
      button.setAttribute('aria-label', 'pause video');
      button.setAttribute('aria-pressed', 'true');
      button.classList.remove('is-pause');
    } else {
      video.pause();
      // 버튼 이미지를 재생 아이콘으로 변경
      buttonImg.src = './assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-influence-slide-play.svg';
      buttonImg.setAttribute('alt', 'play video');
      button.setAttribute('aria-label', 'play video');
      button.setAttribute('aria-pressed', 'false');
      button.classList.add('is-pause');
    }
  }

  function toggleSound(video) {
    const videoBox = video.closest('.influence-content-bx');
    const soundButton = videoBox.querySelector('.influence-content-bx-sound-btn');
    const soundButtonImg = soundButton.querySelector('img');
    
    if (video.muted) {
      video.muted = false;
      // 사운드 켜기 상태로 변경
      soundButtonImg.src = './assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-influence-mute-icon.svg';
      soundButtonImg.setAttribute('alt', 'sound on');
      soundButton.setAttribute('aria-label', 'sound on');
      soundButton.setAttribute('aria-pressed', 'true');
    } else {
      video.muted = true;
      // 사운드 끄기 상태로 변경
      soundButtonImg.src = './assets/images/lifes-good-campaign-2025-radio-optimism-lgcom-images-influence-unmute-icon.svg';
      soundButtonImg.setAttribute('alt', 'sound off');
      soundButton.setAttribute('aria-label', 'sound off');
      soundButton.setAttribute('aria-pressed', 'false');
    }
  }

  // 비디오 재생/일시정지 버튼에 이벤트 리스너 추가
  document.querySelectorAll('.influence-content-bx-play-btn').forEach(button => {
    button.addEventListener('click', function() {
      const video = this.closest('.influence-content-bx').querySelector('video');
      toggleVideo(video);
    });
  });

  // 사운드 버튼에 이벤트 리스너 추가
  document.querySelectorAll('.influence-content-bx-sound-btn').forEach(button => {
    button.addEventListener('click', function() {
      const video = this.closest('.influence-content-bx').querySelector('video');
      toggleSound(video);
    });
  });
}

influence()