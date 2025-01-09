gsap.registerPlugin(ScrollTrigger, ScrollSmoother);
const { toArray } = gsap.utils;


ScrollSmoother.create({
  smooth: 1,
  effects: true,
  smoothTouch: 0.1,
});

const isPC = () => window.matchMedia('(min-width: 1025px)').matches;
let isMobile;

function kvAnimation() {
  const kvVideoBx = document.querySelector('.kv-conbx-video');
  const kvVideo = document.querySelector('.kv-conbx-video video');
  const kvDesc = document.querySelector('.kv-conbx-desc');
  const kvVideoBtn = document.querySelector('.kv-conbx-video-btn');
  const kvVideoClose = document.querySelector('.kv-conbx-video-close');

  if (isPC()) {
    kvVideo.removeAttribute('controls'); 

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
  } else {
    kvVideo.setAttribute('controls', 'controls'); 
  }
}

function handleResize() {
  const newIsMobile = isPC();

  kvAnimation();

  if (newIsMobile !== isMobile) {
    isMobile = newIsMobile;
  } else if (overviewAnimation) {
  }
}

function prodAnimation() {

}


function init() {
  const sections = Array.from(toArray('section'), section => section.className);
  isMobile = isPC();

  if(sections.includes('kv')) {
    kvAnimation()
  }
  if(sections.includes('products')) {
    prodAnimation()
  }

  window.addEventListener('resize', handleResize);
}

init()

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

// // 리사이즈 이벤트 핸들러
// const onResize = () => {
//   updateVideoControls();
//   if (isPC()) {
//     if (!triggers.length) {
//       initAnimation();
//     }
//   } else {
//     if (triggers.length) {
//       destroyAnimation();
//     }
//   }
// };

// 초기화 및 리사이즈 이벤트 등록
// window.addEventListener('resize', onResize);
// onResize(); // 초기 실행



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


