function responsiveVideo(videoContainer = null) {
  // 특정 컨테이너가 전달되면 그 컨테이너 내의 비디오만 처리, 없으면 모든 비디오 처리
  const containers = videoContainer ? [videoContainer] : document.querySelectorAll('.responsive-video');
  
  containers.forEach(video => {
    // 이미 초기화된 비디오는 건너뛰기
    if (video.dataset.initialized === 'true') {
      return;
    }

    const desktopVideoSrc = video.dataset.desktopVideoSrc;
    const mobileVideoSrc = video.dataset.mobileVideoSrc;
    const desktopPosterSrc = video.dataset.desktopPosterSrc;
    const mobilePosterSrc = video.dataset.mobilePosterSrc;
    // 비디오 요소가 이미 존재하는지 확인
    let videoElement = video.querySelector('video');
    const playBtn = video.querySelector('.play-btn');
    
    // 비디오 요소가 없으면 새로 생성
    if (!videoElement) {
      videoElement = document.createElement('video');
      videoElement.muted = true;
      videoElement.loop = true;
      videoElement.playsInline = true;
      videoElement.autoplay = true;
      videoElement.preload = "none";
      videoElement.setAttribute('tabindex', '0');
      video.appendChild(videoElement);
      
      // 비디오 로드 및 자동재생 시작 시 버튼 상태 설정
      videoElement.addEventListener('playing', () => {
        if (playBtn) {
          playBtn.classList.add('pause');
          playBtn.setAttribute('aria-label', 'Play video');
        }
      });
    }
    
    // 미디어 쿼리를 사용하여 모바일 여부 확인 (변수에서 가져온 값 사용)
    const mobileMediaQuery = window.matchMedia(`(max-width: ${768}px)`);
    
    // 화면 크기에 따라 적절한 비디오 소스와 포스터 설정
    const setVideoSource = () => {
      const currentSrc = videoElement.src;
      const newSrc = mobileMediaQuery.matches ? mobileVideoSrc : desktopVideoSrc;
      const newPoster = mobileMediaQuery.matches ? mobilePosterSrc : desktopPosterSrc;
      
      // 포스터 이미지만 먼저 설정
      videoElement.poster = newPoster;
      
      // 탭 패널 내부의 비디오이고, 해당 패널이 보이는 상태일 때만 비디오 로드
      const parentPanel = video.closest('.tab-panel');
      if (!parentPanel || parentPanel.hidden === false) {
        // 소스가 변경된 경우에만 업데이트
        if (currentSrc !== newSrc) {
          videoElement.src = newSrc;
          videoElement.load();
          
          // 자동 재생 (KV 섹션과 탭 패널 비디오 모두)
          videoElement.play().catch(err => {
            console.error('비디오 재생 오류:', err);
          });
        }
      }
    };
    
    // 초기 비디오 소스 설정
    setVideoSource();
    
    // 미디어 쿼리 변경 시 비디오 소스 업데이트
    mobileMediaQuery.addEventListener('change', setVideoSource);
    
    // 재생/일시정지 버튼 설정
    if (playBtn) {
      // 초기 상태 설정 - 비디오가 재생 중이면 pause 클래스 추가
      if (videoElement.src && !videoElement.paused) {
        playBtn.classList.add('pause');
        playBtn.setAttribute('aria-label', 'Play video');
      }
      
      playBtn.addEventListener('click', () => {
        // 비디오 소스가 없는 경우 설정
        if (!videoElement.src) {
          const newSrc = mobileMediaQuery.matches ? mobileVideoSrc : desktopVideoSrc;
          videoElement.src = newSrc;
          videoElement.load();
        }
        
        if (videoElement.paused) {
          videoElement.play().then(() => {
            playBtn.classList.add('pause');
            playBtn.setAttribute('aria-label', 'Play video');
          }).catch(err => {
            console.error('비디오 재생 오류:', err);
          });
        } else {
          videoElement.pause();
          playBtn.classList.remove('pause');
          playBtn.setAttribute('aria-label', 'Pause video');
        }
      });
    }
    
    // 비디오가 초기화되었음을 표시
    video.dataset.initialized = 'true';
  });
}

// 페이지의 모든 탭 패널에 있는 비디오 초기화 (소스 미리 설정)
function initAllTabVideos() {
  // 모든 비디오 컨테이너 찾기
  const allVideos = document.querySelectorAll('.tab-panel .responsive-video');
  
  // 모든 비디오를 초기화하지만 실제 로드는 하지 않음
  allVideos.forEach(video => {
    const videoElement = video.querySelector('video');
    
    if (!videoElement) {
      // 비디오 요소 생성
      const newVideo = document.createElement('video');
      newVideo.muted = true;
      newVideo.loop = true;
      newVideo.playsInline = true;
      newVideo.autoplay = true;
      newVideo.preload = "none";
      newVideo.setAttribute('tabindex', '0');
      
      // 포스터 이미지만 설정
      const mobileMediaQuery = window.matchMedia(`(max-width: ${768}px)`);
      const posterSrc = mobileMediaQuery.matches ? 
        video.dataset.mobilePosterSrc : 
        video.dataset.desktopPosterSrc;
      
      newVideo.poster = posterSrc;
      video.appendChild(newVideo);
      
      // 재생 버튼 이벤트 연결
      const playBtn = video.querySelector('.play-btn');
      if (playBtn) {
        playBtn.addEventListener('click', () => {
          if (!newVideo.src) {
            const src = mobileMediaQuery.matches ? 
              video.dataset.mobileVideoSrc : 
              video.dataset.desktopVideoSrc;
            
            newVideo.src = src;
            newVideo.load();
          }
          
          if (newVideo.paused) {
            newVideo.play().then(() => {
              playBtn.classList.add('pause');
              playBtn.setAttribute('aria-label', 'Play video');
            }).catch(err => {
              console.error('비디오 재생 오류:', err);
            });
          } else {
            newVideo.pause();
            playBtn.classList.remove('pause');
            playBtn.setAttribute('aria-label', 'Pause video');
          }
        });
        
        // 재생 상태 변경 시 버튼 상태 업데이트
        newVideo.addEventListener('playing', () => {
          playBtn.classList.add('pause');
          playBtn.setAttribute('aria-label', 'Play video');
        });
      }
    }
    
    // 초기화되었음을 표시
    video.dataset.initialized = 'true';
  });
}

function loadTabVideos(panel) {
  // 패널 내 비디오 찾기
  const videos = panel.querySelectorAll('.responsive-video');
  
  videos.forEach(video => {
    // 이미 초기화된 비디오에 대해서는 소스만 설정
    const videoElement = video.querySelector('video');
    
    if (videoElement && !videoElement.src) {
      const mobileMediaQuery = window.matchMedia(`(max-width: ${768}px)`);
      const src = mobileMediaQuery.matches ? 
        video.dataset.mobileVideoSrc : 
        video.dataset.desktopVideoSrc;
      
      videoElement.src = src;
      videoElement.load();
      
      // 비디오 자동 재생 
      videoElement.play().catch(err => {
        console.error('비디오 재생 오류:', err);
      });
    }
  });
}

function toggleTabs(container) {
  const tabs = container.querySelectorAll('.tab');
  const panels = container.querySelectorAll('.tab-panel');
  
  // 초기 탭 활성화 (항상 첫 번째 탭)
  const initialTabIndex = 0;
  
  // 초기 탭 활성화
  if (tabs.length > 0) {
    tabs.forEach(t => {
      t.classList.remove('active');
      t.setAttribute('aria-selected', 'false');
    });
    tabs[initialTabIndex].classList.add('active');
    tabs[initialTabIndex].setAttribute('aria-selected', 'true');
    
    panels.forEach(panel => {
      panel.hidden = true;
    });
    panels[initialTabIndex].hidden = false;
    
    // 첫 번째 패널의 비디오 로드
    loadTabVideos(panels[initialTabIndex]);
  }
  
  tabs.forEach((tab, index) => {
    tab.addEventListener('click', () => {
      // 모든 탭 비활성화
      tabs.forEach(t => {
        t.classList.remove('active');
        t.setAttribute('aria-selected', 'false');
      });
      // 선택된 탭 활성화
      tab.classList.add('active');
      tab.setAttribute('aria-selected', 'true');
      
      // 모든 패널 숨김
      panels.forEach(panel => {
        panel.hidden = true;
      });
      // 선택된 패널 표시
      panels[index].hidden = false;
      
      // 현재 활성화된 패널의 비디오 소스 설정 (아직 설정되지 않은 경우)
      loadTabVideos(panels[index]);
    });
  });
}

document.querySelectorAll(".tab-panel-slide .swiper").forEach(function(swiperElement) {
  const swiper = new Swiper(swiperElement, {
    slidesPerView: 4,
    spaceBetween: 24,
    observer: true,
    observeParents: true,
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
    pagination: {
      el: ".swiper-pagination",
      type: "fraction",
    },
    on: {
      init: function() {
        // 슬라이드 개수가 slidesPerView보다 적으면 wrapper에 클래스 추가
        const slidesCount = this.slides.length;
        if (slidesCount <= this.params.slidesPerView) {
          this.el.querySelector('.swiper-wrapper').classList.add('swiper-no-swiping');
        }
      }
    }
  });
});

function init() {
  document.querySelector('body').classList.add('noscroll');
  // toArray 함수 대신 Array.from 사용
  const sections = Array.from(document.querySelectorAll('section'), section => section.className);

  // 페이지 로드 시 KV 섹션의 비디오만 로드
  const kvVideos = document.querySelectorAll('.kv-section .responsive-video');
  kvVideos.forEach(video => {
    responsiveVideo(video);
  });
  
  // 모든 탭의 비디오 미리 초기화
  initAllTabVideos();
  
  // 각 탭 컨테이너를 독립적으로 초기화
  const tabContainers = document.querySelectorAll('.tab-container');
  tabContainers.forEach(container => {
    toggleTabs(container);
  });
}

init();