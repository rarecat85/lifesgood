const overViewSection = document.querySelector('.overview');
const overviewLogo = document.querySelector('.overview-logo');
const overviewTitle = document.querySelector('.overview-title');
const overviewDesc = document.querySelector('.overview-desc');

let isMobile = window.matchMedia('(max-width: 1024px)').matches;
let overviewAnimation = null; // 애니메이션 타임라인 참조

function setOverviewAnimations() {
  const xValue = isMobile ? 0 : window.innerWidth / 2 - overviewLogo.offsetLeft;

  // 기존 애니메이션 제거
  if (overviewAnimation) {
    overviewAnimation.kill();
    overviewAnimation = null;
  }

  // 초기 상태 설정
  gsap.set(overviewDesc, { opacity: 0, y: 20 });
  gsap.set(overviewLogo, { opacity: 0, x: xValue, y: 20 });
  gsap.set(overviewTitle, { opacity: 0, y: 20 });

  // 새로운 애니메이션 타임라인 생성
  overviewAnimation = gsap.timeline()
    .to(overviewLogo, { opacity: 1, y: 0, duration: 1 })
    .to(overviewLogo, { x: 0, duration: isMobile ? 0 : 1 }) // 모바일에서 x 애니메이션 제거
    .to(overviewTitle, { opacity: 1, y: 0, duration: 1 })
    .to(overviewDesc, { opacity: 1, y: 0 })
    .set(overviewDesc, { backgroundPosition: '100% 50%' }, '<')
    .to(overviewDesc, { backgroundPosition: '0% 50%', duration: 3 });

  // ScrollTrigger 설정
  ScrollTrigger.create({
    trigger: overViewSection,
    start: 'top 80%',
    end: 'bottom 80%',
    animation: overviewAnimation,
    toggleActions: 'restart none none none',
  });
}

function handleResize() {
  const newIsMobile = window.matchMedia('(max-width: 1024px)').matches;

  if (newIsMobile !== isMobile) {
    isMobile = newIsMobile;
    setOverviewAnimations(); // 애니메이션 재설정
  } else if (overviewAnimation) {
    // 크기 변경 중 애니메이션 정지 및 재설정
    overviewAnimation.pause(0);
    setOverviewAnimations();
  }
}

if (overViewSection) {
  setOverviewAnimations();
  window.addEventListener('resize', handleResize); // 화면 크기 변경 감지
}
