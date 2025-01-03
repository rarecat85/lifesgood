gsap.registerPlugin(ScrollTrigger);
const { toArray } = gsap.utils;

//overview animation
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


//click animation
const tabList = toArray('.thinQ-tabs-imgbx-fixedimg-tablist li');
const tabBg = toArray('.thinQ-tabs-imgbx-bgwrap picture');

let changeImg = tabBg.find(li => li.classList.contains('active')); // 초기 활성화된 이미지 설정
let currentTimeline = null; // 진행 중인 타임라인 저장

tabList.forEach((tab, index) => {
  tab.addEventListener('click', () => {
    if (currentTimeline) currentTimeline.progress(1); // 현재 타임라인이 진행 중이라면 강제 완료

    // 현재 활성화된 이미지의 <img> 선택
    const currentImg = changeImg.querySelector('img');

    // 클릭된 탭 활성화 처리
    tabList.forEach(t => t.classList.remove('active'));
    tab.classList.add('active');

    // 새로운 타임라인 생성 및 저장
    currentTimeline = gsap.timeline()
    .to(currentImg, {borderRadius:'100%',scale:0,duration:1})
    .eventCallback('onComplete', () => {
      // 기존 활성화 상태 제거 및 새로운 활성화 상태 추가
      tabBg.forEach(bg => bg.classList.remove('active'));
      tabBg[index].classList.add('active');

      gsap.set(currentImg, {borderRadius:'0%',scale:1}); // 이미지 초기화
      changeImg = tabBg[index]; // 활성 이미지 업데이트

      // 타임라인 완료 후 초기화
      currentTimeline = null;
    })
  })
})


