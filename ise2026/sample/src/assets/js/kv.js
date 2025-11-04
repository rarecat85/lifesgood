/**
 * KV 영상 재생 제어
 * intro 영상 재생 완료 후 default 영상을 반복 재생
 * 768px 기준으로 모바일/데스크톱 영상 자동 전환
 */
(function() {
  'use strict';

  const BREAKPOINT = 768; // 모바일 기준점 (px)
  let video = null;
  let isIntroComplete = false;
  let resizeTimer = null;

  /**
   * 현재 화면 크기에 따른 모바일 여부 판단
   */
  function isMobile() {
    return window.innerWidth <= BREAKPOINT;
  }

  /**
   * 현재 화면 크기에 맞는 영상 파일 경로 반환
   * @param {string} type - 'intro' 또는 'default'
   * @returns {string} 영상 파일 경로
   */
  function getVideoPath(type) {
    const isMob = isMobile();
    const prefix = isMob ? 'kv_' + type + '_m' : 'kv_' + type;
    return `./assets/videos/${prefix}.mp4`;
  }

  /**
   * 영상 소스 변경
   * @param {string} videoPath - 변경할 영상 파일 경로
   * @param {boolean} shouldLoop - 반복 재생 여부
   */
  function changeVideoSource(videoPath, shouldLoop) {
    if (!video) return;

    video.src = videoPath;
    video.loop = shouldLoop;
    video.load(); // 새 소스 로드
    video.play().catch(err => {
      console.warn('Video autoplay failed:', err);
    });
  }

  /**
   * intro 영상 재생 완료 후 default 영상으로 전환
   */
  function handleIntroComplete() {
    if (isIntroComplete) return;
    
    isIntroComplete = true;
    const defaultVideoPath = getVideoPath('default');
    changeVideoSource(defaultVideoPath, true); // default 영상은 반복 재생
  }

  /**
   * 화면 크기 변경 시 영상 재설정
   */
  function handleResize() {
    // 디바운스 처리
    clearTimeout(resizeTimer);
    resizeTimer = setTimeout(() => {
      if (!video) return;

      const wasIntroComplete = isIntroComplete;
      const currentVideoPath = video.src;
      const currentIsMobile = currentVideoPath.includes('_m.mp4');
      const newIsMobile = isMobile();

      // 모바일/데스크톱 전환이 발생한 경우에만 영상 변경
      if (currentIsMobile !== newIsMobile) {
        if (wasIntroComplete) {
          // default 영상으로 변경
          const defaultVideoPath = getVideoPath('default');
          changeVideoSource(defaultVideoPath, true);
        } else {
          // intro 영상부터 다시 시작
          isIntroComplete = false;
          const introVideoPath = getVideoPath('intro');
          changeVideoSource(introVideoPath, false);
        }
      }
    }, 250); // 250ms 디바운스
  }

  /**
   * KV 영상 초기화
   */
  function initKVVideo() {
    const videoBx = document.querySelector('.kv .video-bx');
    if (!videoBx) return;

    video = videoBx.querySelector('video');
    if (!video) return;

    // 초기 intro 영상 설정
    const introVideoPath = getVideoPath('intro');
    video.src = introVideoPath;
    video.loop = false; // intro는 반복하지 않음
    video.muted = true;
    video.playsInline = true;
    video.autoplay = true;
    video.preload = 'auto';

    // intro 영상 재생 완료 이벤트 리스너
    video.addEventListener('ended', handleIntroComplete, { once: false });

    // 리사이즈 이벤트 리스너
    window.addEventListener('resize', handleResize);

    // 영상 로드 및 재생 시도
    video.load();
    video.play().catch(err => {
      console.warn('Video autoplay failed:', err);
    });
  }

  /* share btn click event */
  function handleShareBtnClick() {
    const shareBtn = document.querySelector('.share-btn');
    if (!shareBtn) return;
    shareBtn.addEventListener('click', () => {
      const layerPopup = document.querySelector('.layer-popup');
      if (!layerPopup) return;
      
      const isActivating = !layerPopup.classList.contains('active');
      layerPopup.classList.toggle('active');
      layerPopup.setAttribute('aria-hidden', !layerPopup.classList.contains('active'));
      
      // 팝업이 활성화될 때 첫 번째 포커스 가능한 요소로 포커스 이동
      if (isActivating) {
        setTimeout(() => {
          // 팝업 내 첫 번째 포커스 가능한 요소 찾기 (SNS 링크 또는 input)
          const firstFocusable = layerPopup.querySelector('a, button, input');
          if (firstFocusable) {
            firstFocusable.focus();
          }
        }, 100); // CSS transition 고려하여 약간의 딜레이
      }
    });
  }

  /* close btn click event */
  function handleCloseBtnClick() {
    const closeBtn = document.querySelector('.close-btn');
    if (!closeBtn) return;
    closeBtn.addEventListener('click', () => {
      const layerPopup = document.querySelector('.layer-popup');
      if (!layerPopup) return;
      
      const shareBtn = document.querySelector('.share-btn');
      layerPopup.classList.remove('active');
      
      // 팝업 닫을 때 원래 버튼으로 포커스 복귀
      if (shareBtn) {
        shareBtn.focus();
      }
    });
  }

  /* ESC key event for closing popup */
  function handleEscapeKey() {
    document.addEventListener('keydown', (e) => {
      if (e.key === 'Escape') {
        const layerPopup = document.querySelector('.layer-popup');
        if (!layerPopup || !layerPopup.classList.contains('active')) return;
        
        const shareBtn = document.querySelector('.share-btn');
        layerPopup.classList.remove('active');
        
        // ESC로 닫을 때도 원래 버튼으로 포커스 복귀
        if (shareBtn) {
          shareBtn.focus();
        }
      }
    });
  }

  /* copy link button click event */
  function handleCopyLinkBtnClick() {
    const copyLinkBtn = document.querySelector('.copy-link-btn');
    const copyLinkText = document.querySelector('.copy-link-text');
    
    if (!copyLinkBtn || !copyLinkText) return;
    
    copyLinkBtn.addEventListener('click', async () => {
      try {
        const linkText = copyLinkText.textContent.trim();
        
        // Clipboard API 사용 (모던 브라우저)
        if (navigator.clipboard && navigator.clipboard.writeText) {
          await navigator.clipboard.writeText(linkText);
        } else {
          // 구형 브라우저 대비 fallback
          // 임시 textarea 생성하여 복사
          const textarea = document.createElement('textarea');
          textarea.value = linkText;
          textarea.style.position = 'fixed';
          textarea.style.opacity = '0';
          document.body.appendChild(textarea);
          textarea.select();
          document.execCommand('copy');
          document.body.removeChild(textarea);
        }
      } catch (err) {
        console.error('링크 복사 실패:', err);
        // 에러 발생 시 사용자에게 알림 (옵션)
        alert('링크 복사에 실패했습니다. 직접 복사해주세요.');
      }
    });
  }

  /* scroll down button click event */
  function handleScrollDownBtnClick() {
    const scrollDownBtn = document.querySelector('.kv .scroll-down-btn');
    if (!scrollDownBtn) return;
    
    scrollDownBtn.addEventListener('click', () => {
      // 다음 섹션(overview) 찾기
      const kvSection = document.querySelector('.kv');
      if (!kvSection) return;
      
      // 다음 형제 섹션 찾기
      const nextSection = kvSection.nextElementSibling;
      if (!nextSection) return;
      
      // 부드러운 스크롤
      nextSection.scrollIntoView({
        behavior: 'smooth',
        block: 'start'
      });
    });
  }

  // DOMContentLoaded 또는 초기화
  function init() {
    initKVVideo();
    handleShareBtnClick();
    handleCloseBtnClick();
    handleEscapeKey();
    handleCopyLinkBtnClick();
    handleScrollDownBtnClick();
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})();