gsap.registerPlugin(ScrollTrigger, ScrollSmoother);
const { toArray } = gsap.utils;


ScrollSmoother.create({
  smooth: 1,
  effects: true,
  smoothTouch: 0.1,
});



//kv interraction
const kvConBx = document.querySelector('.kv-conbx');
const kvVideoBx = document.querySelector('.kv-conbx-video');
const kvVideo = document.querySelector('.kv-conbx-video video');
const kvDesc = document.querySelector('.kv-conbx-desc');
const kvVideoBtn = document.querySelector('.kv-conbx-video-btn');
const kvVideoClose = document.querySelector('.kv-conbx-video-close');

// PC 여부 확인 함수
const isPC = () => window.matchMedia('(min-width: 1025px)').matches;

// controls 상태 업데이트 함수
const updateVideoControls = () => {
  if (isPC()) {
    kvVideo.removeAttribute('controls'); // PC에서는 controls 제거
  } else {
    kvVideo.setAttribute('controls', 'controls'); // 모바일에서는 controls 추가
  }
};

gsap.set(kvVideoClose,{autoAlpha:0})
kvVideoBtn.addEventListener('click', ()=>{
  gsap.timeline()
  .to(kvDesc,{width:'100%'})
  .to(kvVideoBx,{width:'100%',maxWidth:'100%'},'<')
  .to(kvVideoBtn,{autoAlpha:0},'<')
  .to(kvVideoClose,{autoAlpha:1},'<')

  kvVideo.setAttribute('controls', 'controls');
  kvVideo.play();
})

kvVideoClose.addEventListener('click', ()=>{
  gsap.timeline()
  .to(kvDesc,{width:''})
  .to(kvVideoBx,{width:'', maxWidth:''},'<')
  .to(kvVideoBtn,{autoAlpha:1},'<')
  .to(kvVideoClose,{autoAlpha:0},'<')

  kvVideo.removeAttribute('controls');
  kvVideo.pause();
  kvVideo.currentTime = 0;
})


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
const prodSect = toArray('.products');
let triggers = []; // 생성된 ScrollTrigger 저장 배열
let animations = []; // 생성된 애니메이션 저장 배열

// 애니메이션 초기화 함수
const initAnimation = () => {
  prodSect.forEach((section, index) => {
    const prodInner = section.querySelector('.inner');
    const prodVideoBx = section.querySelector('.products-video');
    const prodVideo = prodVideoBx.querySelector('video');
    const prodVideoTitle = section.querySelector('.products-video-title');
    const pordTbxEyebrow = section.querySelector('.products-textbx-eyebrow');
    const pordTbxTitle = section.querySelector('.products-textbx-title');
    const pordTbxDesc = section.querySelector('.products-textbx-desc');
    const prodTbxBtn = section.querySelector('.btn');

    // 애니메이션 타임라인 생성
    const prodTl = gsap.timeline()
      .set([pordTbxEyebrow, pordTbxTitle, pordTbxDesc, prodTbxBtn], { opacity: 0, y: 20 })
      .to(prodVideoTitle, { opacity: 0, y: 20 })
      .call(() => {
        prodVideo.play();
      })
      .to(prodInner, { maxWidth: '1440px' })
      .to(prodVideoBx, { scale: 0.5083, borderRadius: 28 })
      .to([pordTbxEyebrow, pordTbxTitle, pordTbxDesc, prodTbxBtn], { opacity: 1, y: 0, stagger: 0.2 });

    // ScrollTrigger 생성
    const trigger = ScrollTrigger.create({
      trigger: section,
      start: 'top',
      end: '+=3000',
      pin: true,
      scrub: true,
      animation: prodTl,
      onLeaveBack: () => {
        prodVideo.pause();
        prodVideo.currentTime = 0;
      },
    });

    animations.push(prodTl);
    triggers.push(trigger);
  });
};

// 애니메이션 및 트리거 제거 함수
const destroyAnimation = () => {
  // ScrollTrigger 제거
  triggers.forEach(trigger => trigger.kill());
  triggers = [];

  // 애니메이션 초기화
  animations.forEach(animation => animation.kill());
  animations = [];

  // DOM 요소 초기화
  prodSect.forEach((section) => {
    const prodInner = section.querySelector('.inner');
    const prodVideoBx = section.querySelector('.products-video');
    const prodVideoTitle = section.querySelector('.products-video-title');
    const pordTbxEyebrow = section.querySelector('.products-textbx-eyebrow');
    const pordTbxTitle = section.querySelector('.products-textbx-title');
    const pordTbxDesc = section.querySelector('.products-textbx-desc');
    const prodTbxBtn = section.querySelector('.btn');

    gsap.set([pordTbxEyebrow, pordTbxTitle, pordTbxDesc, prodTbxBtn], { opacity: '', y: '' });
    gsap.set(prodVideoTitle, { opacity: '', y: '' });
    gsap.set(prodInner, { maxWidth: '' });
    gsap.set(prodVideoBx, { scale: '1', borderRadius: '' });
  });
};

// 리사이즈 이벤트 핸들러
const onResize = () => {
  updateVideoControls();
  if (isPC()) {
    if (!triggers.length) {
      initAnimation();
    }
  } else {
    if (triggers.length) {
      destroyAnimation();
    }
  }
};

// 초기화 및 리사이즈 이벤트 등록
window.addEventListener('resize', onResize);
onResize(); // 초기 실행



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


