gsap.registerPlugin(ScrollTrigger);
const { toArray } = gsap.utils;

function init() {
  const mainVideo = document.querySelector('.main-video');
  const mainVideoBx = document.querySelector('.video-bx');
  const videoElement = document.querySelector('.main-video video');

  // 비디오 소스 변경 함수
  function updateVideoSource() {
    if (!videoElement) return;
    
    const isMobile = window.innerWidth <= 768;
    const newSource = isMobile ? './assets/videos/main-video-mobile.mp4' : './assets/videos/main-video-desktop.mp4';
    
    // 현재 소스와 다른 경우에만 변경
    if (videoElement.src !== window.location.origin + window.location.pathname.replace(/\/[^\/]*$/, '/') + newSource.replace('./', '')) {
      const currentTime = videoElement.currentTime;
      const wasPlaying = !videoElement.paused && !videoElement.ended;
      
      videoElement.src = newSource;
      videoElement.load();
      
      // 이전 재생 상태 복원
      videoElement.addEventListener('loadeddata', function onLoadedData() {
        videoElement.currentTime = currentTime;
        if (wasPlaying) {
          videoElement.play();
        }
        videoElement.removeEventListener('loadeddata', onLoadedData);
      });
    }
  }

  // 비디오 재생 함수
  function playVideo() {
    if (videoElement) {
      videoElement.play().catch(error => {
        console.log('비디오 자동 재생이 차단되었습니다:', error);
      });
    }
  }

  // 비디오 정지 및 초기화 함수
  function stopAndResetVideo() {
    if (videoElement) {
      videoElement.pause();
      videoElement.currentTime = 0;
    }
  }

  updateVideoSource();

  let resizeTimeout;
  window.addEventListener('resize', function() {
    clearTimeout(resizeTimeout);
    resizeTimeout = setTimeout(updateVideoSource, 100);
  });

  const mainVideoTl = gsap.timeline({
    onComplete: playVideo, 
    onReverseComplete: stopAndResetVideo 
  })
    .to(mainVideoBx, {width: '100%', borderRadius: '0', duration: 1, ease: 'power2.out'})

  const mainVideoTrigger = ScrollTrigger.create({
    trigger: mainVideo,
    start: 'top',
    end: 'bottom center',
    animation: mainVideoTl,
    toggleActions: 'restart none reverse none',
  });
}

init();