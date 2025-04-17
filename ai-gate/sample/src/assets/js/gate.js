function responsiveVideo() {
  const videoBx = document.querySelectorAll('.responsive-video');
  videoBx.forEach(video => {
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
      videoElement.autoplay = true;
      videoElement.muted = true;
      videoElement.loop = true;
      videoElement.playsInline = true;
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
      
      // 소스가 변경된 경우에만 업데이트
      if (currentSrc !== newSrc) {
        videoElement.src = newSrc;
        videoElement.poster = newPoster;
        videoElement.load();
        videoElement.play().catch(err => {
          console.error('비디오 재생 오류:', err);
        });
      }
    };
    
    // 초기 비디오 소스 설정
    setVideoSource();
    
    // 미디어 쿼리 변경 시 비디오 소스 업데이트
    mobileMediaQuery.addEventListener('change', setVideoSource);
    
    // 재생/일시정지 버튼 설정
    if (playBtn) {
      // 초기 상태 설정 - 비디오가 재생 중이면 pause 클래스 추가
      if (!videoElement.paused) {
        playBtn.classList.add('pause');
        playBtn.setAttribute('aria-label', 'Play video');
      }
      
      playBtn.addEventListener('click', () => {
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
  });
}

function toggleTabs() {
  const tabs = document.querySelectorAll('.tab');
  const panels = document.querySelectorAll('.tab-panel');
  
  // 저장된 탭 인덱스 불러오기
  const savedTabIndex = localStorage.getItem('activeTabIndex');
  
  // 초기 활성 탭 설정 (저장된 값이 있으면 사용, 없으면 기본값 0)
  const initialTabIndex = savedTabIndex !== null ? parseInt(savedTabIndex) : 0;
  
  // 초기 탭 활성화
  if (tabs.length > initialTabIndex) {
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
      
      // 활성화된 탭 인덱스 저장
      localStorage.setItem('activeTabIndex', index);
    });
  });
}

function init() {
  document.querySelector('body').classList.add('noscroll');
  // toArray 함수 대신 Array.from 사용
  const sections = Array.from(document.querySelectorAll('section'), section => section.className);

  responsiveVideo();
  toggleTabs();
}

init();