document.addEventListener('DOMContentLoaded', function() {
  // KV 영역에 비디오 요소 추가
  const kvSection = document.querySelector('.ultra-gear-kv .inner');
  
  // 비디오 컨테이너 생성
  const videoContainer = document.createElement('div');
  videoContainer.className = 'video-container';
  
  // 비디오 요소 생성
  const video = document.createElement('video');
  video.src = '../src/assets/videos/ultra-gear-kv.mp4';
  video.muted = true;
  video.playsInline = true;
  video.preload = 'auto';
  video.setAttribute('playsinline', '');
  video.setAttribute('webkit-playsinline', '');
  
  // 비디오를 컨테이너에 추가하고, 컨테이너를 KV 섹션에 추가
  videoContainer.appendChild(video);
  kvSection.appendChild(videoContainer);
  
  // GSAP ScrollTrigger 및 ScrollSmoother 설정
  gsap.registerPlugin(ScrollTrigger);
  
  // 비디오 로드 완료 후 설정 진행
  video.addEventListener('loadedmetadata', function() {
    // 비디오 초기 설정
    video.currentTime = 0;
    video.pause();
    
    // 스크롤 트리거 생성
    ScrollTrigger.create({
      trigger: '.ultra-gear-kv',
      start: 'top top',
      end: '+=1000%', // 스크롤 거리 조정 (필요에 따라 변경)
      pin: true,     // 섹션 고정
      scrub: 1,    // 스크롤에 따른 애니메이션 부드러움 조정
      onUpdate: function(self) {
        // 비디오의 재생 위치를 스크롤 진행도에 맞게 설정
        if (video.duration) {
          const videoTime = self.progress * video.duration;
          
          // iOS Safari에서 발생할 수 있는 오류 방지
          if (!isNaN(videoTime) && isFinite(videoTime) && videoTime >= 0 && videoTime <= video.duration) {
            video.currentTime = videoTime;
          }
        }
      }
    });
    
    // 모바일 기기에서 비디오 재생 문제 해결을 위한 추가 이벤트 처리
    document.addEventListener('touchstart', function() {
      if (video.paused) {
        video.play().then(() => {
          video.pause();
        }).catch(error => {
          console.error('Video play error:', error);
        });
      }
    }, { once: true });
  });
  
  // 비디오 로드 오류 처리
  video.addEventListener('error', function(e) {
    console.error('Video error:', e);
  });
  
  // 비디오 로드 시작
  video.load();

  //ultra-gear-list 슬라이드 초기화
  const gearList = new Swiper('.ultra-gear-list .slide-bx .swiper', {
    loop: true,
    autoplay: {
      delay: 3000,
      disableOnInteraction: false,
    },
    speed: 500,
    navigation: {
      nextEl: '.ultra-gear-list .slide-button-next',
      prevEl: '.ultra-gear-list .slide-button-prev',
    },
    a11y: {
      nextSlideMessage: 'move to next slide',
      prevSlideMessage: 'move to prev slide',
    },
  });

  // play-btn 클릭 이벤트 처리
  const playBtn = document.querySelector('.ultra-gear-list .play-btn');
  playBtn.addEventListener('click', function() {
    if(this.classList.contains('active')) {
      // 일시정지 상태일 때 -> 재생으로 변경
      gearList.autoplay.start();
      this.classList.remove('active');
    } else {
      // 재생 상태일 때 -> 일시정지로 변경
      gearList.autoplay.stop();
      this.classList.add('active');
    }
  });

  // ultra-gear-list의 li 요소들에 fadeup 효과 적용
  const applyFadeUpAnimation = () => {
    // 모든 ultra-gear-list 선택
    const lists = document.querySelectorAll('.ultra-gear-list');
    
    // 애니메이션 요소들을 초기 상태로 설정
    gsap.set('.ultra-gear-list li', { 
      opacity: 0, 
      y: 50 
    });
    
    // overview 섹션이 나타날 때만 리스트 아이템 애니메이션을 시작하도록 설정
    ScrollTrigger.create({
      trigger: '.ultra-gear-list-container',
      start: 'bottom bottom', // overview 섹션이 화면 하단에 닿기 시작할 때
      end: '+=500%', // 스크롤 거리 조정 (필요에 따라 변경)
      onEnter: () => {
        // KV 영역이 완전히 지나간 후에만 애니메이션 활성화
        lists.forEach((list, listIndex) => {
          const listItems = list.querySelectorAll('li');
          
          // 각 리스트의 아이템별로 애니메이션 적용
          listItems.forEach((item, itemIndex) => {
            // 리스트별로 시작 딜레이를 다르게 적용
            const baseDelay = listIndex * 0.3;
            const itemDelay = baseDelay + (itemIndex * 0.15);
            
            gsap.to(item, {
              opacity: 1,
              y: 0,
              duration: 0.8,
              ease: 'power2.out',
              delay: itemDelay,
              scrollTrigger: {
                trigger: list,
                start: 'top 30%',
              }
            });
          });
        });
      }
    });
  };
  
  // fadeup 애니메이션 적용
  applyFadeUpAnimation();

  // feature 섹션 비디오 자동 재생 설정
  const featureVideo = document.querySelector('.ultra-gear-feature video');
  if (featureVideo) {
    // 초기 상태 설정 (화면에 보이기 전에는 일시정지)
    featureVideo.pause();
    
    // ScrollTrigger 설정
    ScrollTrigger.create({
      trigger: '.ultra-gear-feature',
      start: 'top bottom', // 섹션의 상단이 화면 하단에 닿을 때
      onEnter: () => {
        featureVideo.play();
      },
      onLeaveBack: () => {
        featureVideo.pause();
      }
    });
  }

  // specs 섹션 비디오 재생/일시정지 토글 기능
  const videoPlayButtons = document.querySelectorAll('.video-list .play-btn');
  
  videoPlayButtons.forEach(button => {
    button.addEventListener('click', function() {
      // 현재 버튼이 속한 li 요소 내의 video 찾기
      const videoContainer = this.closest('.border-bx');
      const video = videoContainer.querySelector('video');
      
      if(this.classList.contains('active')) {
        // 일시정지 상태일 때 -> 재생으로 변경
        video.play();
        this.classList.remove('active');
      } else {
        // 재생 상태일 때 -> 일시정지로 변경
        video.pause();
        this.classList.add('active');
      }
    });
  });

  // feature 섹션 비디오 재생/일시정지 토글 기능
  const featurePlayBtn = document.querySelector('.ultra-gear-feature .play-btn');
  if (featurePlayBtn) {
    featurePlayBtn.addEventListener('click', function() {
      // 현재 버튼이 속한 video-bx 요소 내의 video 찾기
      const videoContainer = this.closest('.video-bx');
      const video = videoContainer.querySelector('video');
      
      if(this.classList.contains('active')) {
        // 일시정지 상태일 때 -> 재생으로 변경
        video.play();
        this.classList.remove('active');
      } else {
        // 재생 상태일 때 -> 일시정지로 변경
        video.pause();
        this.classList.add('active');
      }
    });
  }

});
