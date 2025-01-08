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
    .to(overviewLogo, { opacity: 1, y: 0,  })
    .to(overviewLogo, { x: 0, duration: isMobile ? 0 : 0.5 }) // 모바일에서 x 애니메이션 제거
    .to(overviewTitle, { opacity: 1, y: 0, })
    .to(overviewDesc, { opacity: 1, y: 0 })
    .set(overviewDesc, { backgroundPosition: '100% 50%' }, '<')
    .to(overviewDesc, { backgroundPosition: '0% 50%', duration: 1.5 });

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

//Prod animation
const prodBox = toArray('.products');
let currentAnimatingIndex = 0; // 현재 애니메이션 중인 인덱스

// 스크롤 제어를 위한 클래스 추가/제거 함수
function disableScroll() {
  document.body.classList.add('noscroll');
}
function enableScroll() {
  document.body.classList.remove('noscroll');
}

// ScrollTrigger의 start와 end 위치를 업데이트하는 함수
function updateScrollTriggers() {
  ScrollTrigger.refresh();
}

// 모든 박스를 초기 상태로 설정
prodBox.forEach(prod => {
  gsap.set(prod, { pointerEvents: 'none' }); // 클릭 비활성화
});

// 애니메이션 실행 함수
function animateProdBox(index) {
  if (index >= prodBox.length) {
    enableScroll(); // 모든 애니메이션 완료 시 스크롤 활성화
    return;
  }

  const prod = prodBox[index];
  const prodTitle = prod.querySelector('.products-textbx-title');
  const prodInner = prod.querySelector('.inner');
  const prodVideo = prod.querySelector('.products-video');

  // 스크롤 비활성화
  disableScroll();

  gsap.timeline({
    onComplete: () => {
      prod.classList.add('active'); // 애니메이션 완료 후 활성화
      currentAnimatingIndex = index + 1; // 다음 인덱스로 이동
      enableScroll(); // 애니메이션 완료 후 스크롤 활성화
      updateScrollTriggers(); // ScrollTrigger 위치 업데이트
    }
  })
    .to(prodTitle, { y: 20, opacity: 0, duration: 1 })
    .to(prodInner, { maxWidth: '1440px' })
    .to(prodVideo, { 
      width: () => (732 / 16) + 'rem', 
      height: () => (412 / 16) + 'rem', 
      borderRadius: 28 
    })
    .set(prodTitle, { x: '50%', y: '50%', opacity: 1 });
}

// ScrollTrigger 설정
prodBox.forEach((prod, index) => {
  ScrollTrigger.create({
    trigger: prod,
    start: 'top 10%',
    end: 'bottom 80%',
    onEnter: () => {
      if (index === currentAnimatingIndex && !prod.classList.contains('active')) {
        animateProdBox(index);
      }
    },
    onEnterBack: () => {
      // 필요 시 뒤로 스크롤 시 동작 추가
    },
    // markers: true, // 디버깅용
  });
});

// 페이지 로드 후 ScrollTrigger 동기화
window.addEventListener('load', () => {
  updateScrollTriggers();
});

// 윈도우 리사이즈 시 ScrollTrigger 동기화
window.addEventListener('resize', () => {
  updateScrollTriggers();
});



//click animation
const tabList = toArray('.thinQ-tabs-imgbx-fixedimg-tablist li');
const tabBg = toArray('.thinQ-tabs-imgbx-bgwrap picture');
const tabCon = toArray('.thinQ-tabs-conbx-tabcon');

let changeImg = tabBg.find(li => li.classList.contains('active')); // 초기 활성화된 이미지 설정
let currentTimeline = null; // 진행 중인 타임라인 저장

tabList.forEach((tab, index) => {
  tab.addEventListener('click', () => {
    if (currentTimeline) currentTimeline.progress(1); // 현재 타임라인이 진행 중이라면 강제 완료

    // 현재 활성화된 이미지의 <img> 선택
    const currentImg = changeImg.querySelector('img');

    // 클릭된 탭 활성화 처리
    tabList.forEach(t => {
      t.classList.remove('active')
      t.setAttribute('aria-selected','false');
    });
    tab.classList.add('active');
    tab.setAttribute('aria-selected','true');

    // tabContent 활성화 처리
    tabCon.forEach(con => {
      con.classList.remove('active');
      con.setAttribute('tabindex','-1');
    });
    tabCon[index].classList.add('active');
    tabCon[index].setAttribute('tabindex','0');

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


