// GSAP Plugin Registration
gsap.registerPlugin(ScrollTrigger);

// Resize 시 ScrollTrigger 재계산
window.addEventListener('resize', () => {
  ScrollTrigger.refresh();
});

// Keyvisual Scroll Interaction
const keyvisualSection = document.querySelector('.sustainability-keyvisual');
const keyvisualOverlay = document.querySelector('.keyvisual-overlay');
const keyvisualOverlayTitle = document.querySelector('.keyvisual-overlay-title');
const keyvisualOverlayDesc = document.querySelector('.keyvisual-overlay-desc');

if (keyvisualSection) {
  const tl = gsap.timeline({
    scrollTrigger: {
      trigger: keyvisualSection,
      start: 'top top',
      end: '+=200%',
      pin: true,
      scrub: 1,
    }
  });

  // 1. 블러 오버레이 원형으로 확장 + opacity
  tl.to(keyvisualOverlay, {
    clipPath: 'circle(150% at 50% 50%)',
    opacity: 1,
    duration: 0.5,
    ease: 'power2.out',
  });

  // 2. 타이틀 아래에서 위로 등장
  tl.to(keyvisualOverlayTitle, {
    opacity: 1,
    y: 0,
    duration: 0.4,
  });

  // 3. 설명 텍스트 아래에서 위로 등장
  tl.to(keyvisualOverlayDesc, {
    opacity: 1,
    y: 0,
    duration: 0.4,
  });

  // 초기 상태 설정
  gsap.set(keyvisualOverlayTitle, { y: 50 });
  gsap.set(keyvisualOverlayDesc, { y: 50 });
}

// Keyvisual Video Play/Pause
const keyvisualVideo = document.querySelector('.keyvisual-video');
const keyvisualVideoBtn = document.querySelector('.keyvisual-video-btn');

if (keyvisualVideo && keyvisualVideoBtn) {
  keyvisualVideoBtn.addEventListener('click', function() {
    if (keyvisualVideo.paused) {
      keyvisualVideo.play();
      keyvisualVideoBtn.classList.remove('is-paused');
      keyvisualVideoBtn.setAttribute('aria-label', 'Pause video');
    } else {
      keyvisualVideo.pause();
      keyvisualVideoBtn.classList.add('is-paused');
      keyvisualVideoBtn.setAttribute('aria-label', 'Play video');
    }
  });
}

// Sticky Bar Scroll Interaction
const stickyBar = document.querySelector('.sustainability-sticky-bar');
const overviewSection = document.querySelector('.sustainability-overview');
const nextSection = document.querySelector('.sustainability-overview + section'); // overview 다음 섹션

if (stickyBar && overviewSection) {
  let isSticky = false;
  let isExpanded = false;
  
  // CTA 링크 요소
  const ctaLink = stickyBar.querySelector('.sticky-bar-cta-link');
  
  // sticky bar의 overview 섹션 내 위치 계산 (페이지 기준)
  const overviewTop = overviewSection.getBoundingClientRect().top + window.scrollY;
  const stickyBarTop = stickyBar.getBoundingClientRect().top + window.scrollY;
  const stickyBarOffsetFromOverview = stickyBarTop - overviewTop;

  // 1단계: sticky bar가 상단에 도달하면 sticky만 됨 (펼쳐지지 않음)
  // trigger를 overview 섹션으로 하여 sticky bar가 fixed가 되어도 트리거 위치 유지
  ScrollTrigger.create({
    trigger: overviewSection,
    start: `top+=${stickyBarOffsetFromOverview} top+=16`,
    endTrigger: 'body',
    end: 'bottom bottom',
    onEnter: () => {
      stickyBar.classList.add('is-sticky');
      if (ctaLink) ctaLink.classList.add('change');
      isSticky = true;
    },
    onLeaveBack: () => {
      // 원래 자리로 돌아오면 sticky 해제
      stickyBar.classList.remove('is-sticky');
      if (ctaLink) ctaLink.classList.remove('change');
      isSticky = false;
    }
  });

  // 2단계: 다음 섹션 진입 시 펼쳐짐 (다음 섹션이 화면 상단에 도달)
  if (nextSection) {
    ScrollTrigger.create({
      trigger: nextSection,
      start: 'top top',
      onEnter: () => {
        stickyBar.classList.add('is-expanded');
        isExpanded = true;
      },
      onLeaveBack: () => {
        // overview 영역으로 돌아오면 메뉴 접기
        stickyBar.classList.remove('is-expanded');
        isExpanded = false;
      }
    });
  }

  // KV 영역으로 돌아갈 때 처리
  if (keyvisualSection) {
    ScrollTrigger.create({
      trigger: keyvisualSection,
      start: 'bottom top+=100',
      onEnterBack: () => {
        // KV로 돌아가면 메뉴만 접기 (sticky는 1단계에서 해제됨)
        stickyBar.classList.remove('is-expanded');
        isExpanded = false;
      }
    });
  }
}

// ESG Data Grid Scroll Interaction
const esgSection = document.querySelector('.sustainability-esg-data');
const esgItems = document.querySelectorAll('.esg-grid-item');

if (esgSection && esgItems.length > 0) {
  const spreadDistance = 300; // 펼쳐지는 거리

  // 각 박스의 초기 위치 설정 (펼쳐진 상태)
  gsap.set('.item-1', { x: -250, y: -250 });
  gsap.set('.item-2', { y: -spreadDistance });
  gsap.set('.item-3', { x: 0, y: -200 });
  gsap.set('.item-4', { x: 200, y: -100 });
  gsap.set('.item-5', { x: -150, y: 50 });
  gsap.set('.item-6', { x: 50, y: -150 });
  gsap.set('.item-7', { x: -50, y: -100 });
  gsap.set('.item-8', { x: 100, y: -50 });
  gsap.set('.item-9', { x: 150, y: 100 });

  const esgTl = gsap.timeline({
    scrollTrigger: {
      trigger: esgSection,
      start: 'top top',
      end: '+=150%',
      pin: true,
      scrub: 1,
    }
  });

  // 모든 박스를 원래 위치로 애니메이션
  esgTl.to('.item-1', { x: 0, y: 0, duration: 1, ease: 'power2.out' }, 0);
  esgTl.to('.item-2', { y: 0, duration: 1, ease: 'power2.out' }, 0);
  esgTl.to('.item-3', { x: 0, y: 0, duration: 1, ease: 'power2.out' }, 0);
  esgTl.to('.item-4', { x: 0, y: 0, duration: 1, ease: 'power2.out' }, 0);
  esgTl.to('.item-5', { x: 0, y: 0, duration: 1, ease: 'power2.out' }, 0);
  esgTl.to('.item-6', { x: 0, y: 0, duration: 1, ease: 'power2.out' }, 0);
  esgTl.to('.item-7', { x: 0, y: 0, duration: 1, ease: 'power2.out' }, 0);
  esgTl.to('.item-8', { x: 0, y: 0, duration: 1, ease: 'power2.out' }, 0);
  esgTl.to('.item-9', { x: 0, y: 0, duration: 1, ease: 'power2.out' }, 0);
}

// Vision Section - 카드 순환 인터랙션
const visionSection = document.querySelector('.sustainability-vision');
const visionItems = document.querySelectorAll('.vision-image-item');

if (visionSection && visionItems.length > 0) {
  const cardHeight = 270;
  const gap = 60;
  const step = cardHeight + gap; // 각 카드 간 간격
  const centerY = 215; // 컨테이너 가운데 (700 - 270) / 2
  const totalCards = visionItems.length;
  
  // 마지막 카드가 가운데에 올 때까지의 이동량 계산
  // 첫 번째 카드가 centerY - step 위치, 마지막 카드가 centerY 위치가 되려면
  // 마지막 카드의 초기 위치: centerY + (totalCards - 2) * step
  // 마지막 카드가 centerY로 오려면: (totalCards - 2) * step 만큼 이동
  const totalScrollDistance = (totalCards - 2) * step;
  
  // end 값을 동적으로 계산 (뷰포트 높이 기준 백분율)
  const scrollEndPercent = Math.round((totalScrollDistance / window.innerHeight) * 100) + 100; // 여유분 추가

  // 카드 위치 업데이트 함수
  function updateVisionCards(progress) {
    // 시작 딜레이 적용 (처음 10%는 대기)
    const delayRatio = 0.1;
    const adjustedProgress = Math.max(0, (progress - delayRatio) / (1 - delayRatio));
    
    const scrollAmount = adjustedProgress * totalScrollDistance;

    visionItems.forEach((card, index) => {
      // 각 카드의 y 위치 (가운데 기준으로 계산)
      const baseY = centerY + (index - 1) * step;
      const y = baseY - scrollAmount;

      // 가운데 위치와의 거리에 따라 기울기 결정
      const distanceFromCenter = y - centerY;
      const maxTilt = 10;
      let rotation = 0;
      let origin = 'center';

      if (distanceFromCenter < -step / 2) {
        // 위쪽에 있음 (양수 기울기)
        rotation = Math.min(maxTilt, Math.abs(distanceFromCenter) / step * maxTilt);
        origin = 'right bottom';
      } else if (distanceFromCenter > step / 2) {
        // 아래쪽에 있음 (음수 기울기)
        rotation = -Math.min(maxTilt, Math.abs(distanceFromCenter) / step * maxTilt);
        origin = 'right top';
      }

      // 화면 밖으로 나가면 페이드아웃
      let opacity = 1;
      if (y < -cardHeight) {
        opacity = 0;
      } else if (y < 0) {
        opacity = (y + cardHeight) / cardHeight;
      }

      // z-index는 가운데에 가까울수록 높게
      const zIndex = Math.round(totalCards - Math.abs(distanceFromCenter) / step);

      gsap.set(card, {
        y: y,
        rotation: rotation,
        transformOrigin: origin,
        opacity: opacity,
        zIndex: zIndex,
      });
    });
  }

  // 초기 상태 설정
  updateVisionCards(0);

  // ScrollTrigger (마지막 카드가 가운데에 올 때까지)
  ScrollTrigger.create({
    trigger: visionSection,
    start: 'top top',
    end: `+=${scrollEndPercent}%`,
    pin: true,
    scrub: 1,
    onUpdate: (self) => {
      updateVisionCards(self.progress);
    }
  });
}
