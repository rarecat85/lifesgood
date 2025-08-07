function responsiveVideo(videoContainer = null) {
  // 특정 컨테이너가 전달되면 그 컨테이너 내의 비디오만 처리, 없으면 모든 비디오 처리
  const containers = videoContainer ? [videoContainer] : document.querySelectorAll('.responsive-video');
  
  containers.forEach(video => {
    // 초기화 여부 확인을 위한 플래그
    const isInitialized = video.dataset.initialized === 'true';
    
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
      
      // 비디오 로드 및 자동재생 시 버튼 상태 설정
      videoElement.addEventListener('playing', () => {
        if (playBtn) {
          playBtn.classList.add('pause');
          playBtn.setAttribute('aria-label', 'Play video');
        }
      });
    }
    
    // 미디어 쿼리를 사용하여 모바일 여부 확인
    const mobileMediaQuery = window.matchMedia(`(max-width: 768px)`);
    
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
    
    // 이미 초기화된 비디오라면 기존 이벤트 리스너 제거 (중복 방지)
    if (isInitialized && video.mobileMediaQueryListener) {
      mobileMediaQuery.removeEventListener('change', video.mobileMediaQueryListener);
    }
    
    // 미디어 쿼리 변경 시 비디오 소스 업데이트 (모든 비디오에 연결)
    video.mobileMediaQueryListener = setVideoSource;
    mobileMediaQuery.addEventListener('change', video.mobileMediaQueryListener);
    
    // 재생/일시정지 버튼 설정 (초기화되지 않은 경우에만)
    if (playBtn && !isInitialized) {
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
      const mobileMediaQuery = window.matchMedia(`(max-width: 768px)`);
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
      const mobileMediaQuery = window.matchMedia(`(max-width: 768px)`);
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

function preloadTabImages() {
  // 모든 탭 패널 내 이미지 선택
  const tabPanelImages = document.querySelectorAll('.tab-panel img[loading="lazy"]');
  
  // 현재 보이지 않는 탭의 이미지만 프리로드
  tabPanelImages.forEach(img => {
    const panel = img.closest('.tab-panel');
    
    // 현재 보이지 않는 탭의 이미지에 대해서만 처리
    if (panel.hidden) {
      // 현재 src 값을 저장
      const originalSrc = img.getAttribute('src');
      
      // 이미 프리로드된 이미지는 건너뛰기
      if (img.dataset.preloaded === 'true') {
        return;
      }
      
      // 이미지 프리로딩 처리
      const preloadImage = new Image();
      preloadImage.onload = function() {
        // 프리로드 완료 표시
        img.dataset.preloaded = 'true';
      };
      preloadImage.src = originalSrc;
      
      // picture 요소 내부의 source 태그도 프리로드 처리
      if (img.parentElement.tagName.toLowerCase() === 'picture') {
        const sources = img.parentElement.querySelectorAll('source');
        sources.forEach(source => {
          const sourceSrcset = source.getAttribute('srcset');
          if (sourceSrcset) {
            const preloadSource = new Image();
            preloadSource.srcset = sourceSrcset;
          }
        });
      }
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
    
    // 다른 패널의 이미지 미리 로드 시작
    setTimeout(preloadTabImages, 300);
  }
  
  tabs.forEach((tab, index) => {
    tab.addEventListener('click', () => {
      // 탭 클릭 직전에 보여질 패널 내의 이미지들의 loading 속성 제거
      const targetPanel = panels[index];
      const targetImages = targetPanel.querySelectorAll('img[loading="lazy"]');
      targetImages.forEach(img => {
        if (img.dataset.preloaded === 'true') {
          img.removeAttribute('loading');
        }
      });
      
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
  let swiper = null;
  
  // 스와이퍼 초기화 함수
  const initSwiper = () => {
    if (window.matchMedia('(max-width: 768px)').matches) {
      // 768px 이하일 경우 스와이퍼 파괴
      if (swiper !== null) {
        swiper.destroy(true, true);
        swiper = null;
      }
    } else {
      // 768px 초과일 경우 스와이퍼 초기화
      if (swiper === null) {
        swiper = new Swiper(swiperElement, {
          slidesPerView: 4,
          spaceBetween: 24,
          observer: true,
          observeParents: true,
          navigation: {
            prevEl: ".tab-panel-slide .swiper-button-prev",
            nextEl: ".tab-panel-slide .swiper-button-next",
          },
          pagination: {
            el: ".tab-panel-slide .swiper-pagination",
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
      }
    }
  };
  
  // 초기 실행
  initSwiper();
  
  // 리사이즈 이벤트에 대응
  window.addEventListener('resize', initSwiper);
});

var storiesSlide = new Swiper(".stories-section .swiper", {
  slidesPerView: 1.2,
  spaceBetween: 10,
  breakpoints: {
    768: {
      slidesPerView: 3,
      spaceBetween: 24,
    },
  },
});

var youtubeVideoSlide = new Swiper(".youtube-video-list .swiper", {
  slidesPerView: 1,
  spaceBetween: 10,
  navigation: {
    prevEl: ".youtube-video-list .swiper-button-prev",
    nextEl: ".youtube-video-list .swiper-button-next",
  },
  pagination: {
    el: ".youtube-video-list .swiper-pagination",
    type: "fraction",
  },
  breakpoints: {
    768: {
      slidesPerView: 3,
      spaceBetween: 24,
    },
    1280: {
      slidesPerView: 5,
      spaceBetween: 24,
    },
  },
});

/* youtube pop */
const popShowBtn = document.querySelector(".youtube-video-list .video-btn");
popShowBtn.addEventListener("click", openYoutubePop);

function openYoutubePop() {
  const body = document.querySelector("body");
  const youtubeId = this.dataset.src;
  
  // 기존 팝업이 있으면 제거
  const existingPop = document.querySelector('.youtube-pop');
  if (existingPop) {
    existingPop.remove();
  }
  
  // 새로운 팝업 요소 생성
  const popupElement = document.createElement('div');
  popupElement.className = 'youtube-pop';
  
  // 로딩 상태 표시
  popupElement.innerHTML = `
    <div class="youtube-pop-inner">
      <button type="button" class="youtube-pop-close" aria-label="Close video">×</button>
      <div class="loading-container">
        <div class="loading-wrapper">
          <div class="spinner" role="status" aria-live="polite">
            <span class="a11y-text">로딩중...</span>
          </div>
        </div>
      </div>
    </div>
  `;
  
  // body에 팝업 요소 추가
  body.appendChild(popupElement);
  
  // 닫기 버튼에 이벤트 리스너 추가
  const closeButton = popupElement.querySelector('.youtube-pop-close');
  closeButton.addEventListener('click', closeYoutubePop);
  
  // ESC 키 누르면 팝업 닫히도록 이벤트 리스너 추가
  document.addEventListener('keydown', handleEscKey);
  
  // body에 스크롤 방지 클래스 추가
  body.classList.add('popup-open');
  
  // YouTube oEmbed API를 사용하여 동영상 정보 가져오기
  fetch(`https://www.youtube.com/oembed?url=https://www.youtube.com/watch?v=${youtubeId}&format=json`)
    .then(response => {
      if (!response.ok) {
        throw new Error('동영상 정보를 가져올 수 없습니다.');
      }
      return response.json();
    })
    .then(data => {
      // YouTube 동영상 제목 가져오기
      const videoTitle = data.title || 'YouTube 동영상';
      
      // iframe 요소로 팝업 내용 업데이트
      const popupInner = popupElement.querySelector('.youtube-pop-inner');
      popupInner.innerHTML = `
        <button type="button" class="youtube-pop-close" aria-label="Close video">×</button>
        <iframe 
          src="https://www.youtube.com/embed/${youtubeId}?mute=1&enablejsapi=1" 
          enablejsapi="1" 
          title="${videoTitle}" 
          allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
          referrerpolicy="strict-origin-when-cross-origin" 
          allowfullscreen>
        </iframe>
      `;
      
      // 닫기 버튼에 이벤트 리스너 다시 추가
      const newCloseButton = popupInner.querySelector('.youtube-pop-close');
      newCloseButton.addEventListener('click', closeYoutubePop);
    })
    .catch(error => {
      console.error('YouTube 동영상 정보 가져오기 오류:', error);
      
      // 오류 시 기본 iframe으로 표시
      const popupInner = popupElement.querySelector('.youtube-pop-inner');
      popupInner.innerHTML = `
        <button type="button" class="youtube-pop-close" aria-label="Close video">×</button>
        <iframe 
          src="https://www.youtube.com/embed/${youtubeId}?mute=1&enablejsapi=1" 
          enablejsapi="1" 
          title="YouTube 동영상" 
          allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
          referrerpolicy="strict-origin-when-cross-origin" 
          allowfullscreen>
        </iframe>
      `;
      
      // 닫기 버튼에 이벤트 리스너 다시 추가
      const newCloseButton = popupInner.querySelector('.youtube-pop-close');
      newCloseButton.addEventListener('click', closeYoutubePop);
    });
}

// 유튜브 팝업 닫기 함수
function closeYoutubePop() {
  const popup = document.querySelector('.youtube-pop');
  if (popup) {
    popup.remove();
  }
  
  // ESC 키 이벤트 리스너 제거
  document.removeEventListener('keydown', handleEscKey);
  
  // body에서 스크롤 방지 클래스 제거
  document.querySelector('body').classList.remove('popup-open');
}

// ESC 키 처리 함수
function handleEscKey(event) {
  if (event.key === 'Escape') {
    closeYoutubePop();
  }
}

function init() {
  // toArray 함수 대신 Array.from 사용
  const sections = Array.from(document.querySelectorAll('section'), section => section.className);

  // 페이지 로드 시 KV 섹션의 비디오만 로드
  const kvVideos = document.querySelectorAll('.kv-section .responsive-video');
  kvVideos.forEach(video => {
    responsiveVideo(video);
  });
  
  // thinq-section의 비디오도 로드
  const thinqVideos = document.querySelectorAll('.thinq-section .responsive-video');
  thinqVideos.forEach(video => {
    responsiveVideo(video);
  });
  
  // 모든 탭의 비디오 미리 초기화
  initAllTabVideos();
  
  // 각 탭 컨테이너를 독립적으로 초기화
  const tabContainers = document.querySelectorAll('.tab-container');
  tabContainers.forEach(container => {
    toggleTabs(container);
  });

  // 모든 유튜브 비디오 버튼에 클릭 이벤트 추가
  const videoButtons = document.querySelectorAll(".youtube-video-list .video-btn");
  videoButtons.forEach(button => {
    button.addEventListener("click", openYoutubePop);
  });

  // 리사이즈 이벤트에 대한 처리 추가
  let resizeTimeout;
  window.addEventListener("resize", function() {
    clearTimeout(resizeTimeout);
    resizeTimeout = setTimeout(function() {
      // 현재 화면 크기 확인
      const isMobile = window.matchMedia('(max-width: 768px)').matches;
      
      // 모든 responsive-video 요소 처리
      document.querySelectorAll('.responsive-video').forEach(video => {
        if (!video.dataset.desktopVideoSrc || !video.dataset.mobileVideoSrc) return;
        
        const videoElement = video.querySelector('video');
        if (!videoElement) return;
        
        // 비디오 소스 결정
        const desktopVideoSrc = video.dataset.desktopVideoSrc;
        const mobileVideoSrc = video.dataset.mobileVideoSrc;
        const desktopPosterSrc = video.dataset.desktopPosterSrc;
        const mobilePosterSrc = video.dataset.mobilePosterSrc;
        
        const currentSrc = videoElement.getAttribute('src');
        const newSrc = isMobile ? mobileVideoSrc : desktopVideoSrc;
        const newPoster = isMobile ? mobilePosterSrc : desktopPosterSrc;
        
        // 탭 패널 내부의 비디오인 경우, 보이는 상태일 때만 변경
        const parentPanel = video.closest('.tab-panel');
        if (parentPanel && parentPanel.hidden === true) return;
        
        // 소스가 변경된 경우에만 업데이트
        if (currentSrc !== newSrc) {
          const wasPlaying = !videoElement.paused;
          const currentTime = videoElement.currentTime;
          
          // 새 비디오 요소 생성
          const newVideo = document.createElement('video');
          newVideo.muted = true;
          newVideo.loop = true;
          newVideo.playsInline = true;
          newVideo.autoplay = wasPlaying;
          newVideo.preload = "auto";
          newVideo.setAttribute('tabindex', '0');
          newVideo.poster = newPoster;
          newVideo.src = newSrc;
          
          // 이전 비디오의 재생 상태 및 이벤트 리스너 복사
          const playBtn = video.querySelector('.play-btn');
          if (playBtn) {
            newVideo.addEventListener('playing', () => {
              playBtn.classList.add('pause');
              playBtn.setAttribute('aria-label', 'Play video');
            });
          }
          
          // 이전 비디오 요소 제거
          video.removeChild(videoElement);
          
          // 새 비디오 요소 추가
          video.appendChild(newVideo);
          
          // 이전 재생 상태에 따라 재생 시작
          if (wasPlaying) {
            newVideo.currentTime = currentTime;
            newVideo.play().catch(err => {
              console.error('비디오 재생 오류:', err);
            });
          }
        }
      });
    }, 150); // 150ms 딜레이로 디바운스
  });
}

init();