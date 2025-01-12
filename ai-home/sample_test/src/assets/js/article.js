gsap.registerPlugin(ScrollTrigger, ScrollSmoother);
const { toArray } = gsap.utils;


ScrollSmoother.create({
  smooth: 1,
  effects: true,
  smoothTouch: 0.1,
});

const isPC = () => window.matchMedia('(min-width: 769px)').matches;
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

function overviewAnimation() {
  const overviewSection = document.querySelector('.overview');
  const overviewTitle = document.querySelector('.overview-logo-title');
  const overviewLogo = document.querySelector('.overview-logo-img');
  const overviewDesc = document.querySelector('.overview-desc');

  function calculateLogoXPosition() {
    return innerWidth / 2 - overviewLogo.offsetLeft ;
  }

  function clearOverviewAnimation() {
    // 기존 ScrollTrigger 및 애니메이션 초기화
    ScrollTrigger.getById("overview-trigger")?.kill();
  }

  function setupOverviewAnimation() {
    clearOverviewAnimation(); // 기존 설정 제거


    // 새 애니메이션 타임라인 설정
    const overviewTL = gsap.timeline()
      .set(overviewTitle, {
        webkitMaskImage: "linear-gradient(to right, black 0%, black 0%, transparent 0%)",
        maskImage: "linear-gradient(to right, black 0%, black 0%, transparent 100%)",
        webkitMaskRepeat: "no-repeat",
        maskRepeat: "no-repeat",
      })
      .set(overviewLogo, { x: calculateLogoXPosition(), y: 20, opacity: 0 })
      .set(overviewDesc, {opacity:0, y:20})
      .to(overviewLogo, { opacity: 1, y: 0, duration: 1 }) 
      .to(overviewLogo, { x: 0, duration: 1 }) 
      .to(overviewTitle, {
        webkitMaskImage: "linear-gradient(to right, black 100%, black 100%, transparent 100%)",
        maskImage: "linear-gradient(to right, black 100%, black 100%, transparent 100%)",
        duration: 1,
        ease: "power2.out"
      })
      .to(overviewDesc, { opacity: 1, y: 0}, '-=0.5')

    // ScrollTrigger 생성
    ScrollTrigger.create({
      id: "overview-trigger",
      trigger: overviewSection,
      start: 'top center',
      end: 'bottom center',
      animation: overviewTL,
      toggleActions: 'restart none none none', 
    });
  }

  // 초기화 후 새 설정 실행
  setupOverviewAnimation();

  // 리사이즈 시 초기화 및 새 설정 실행
  window.addEventListener('resize', setupOverviewAnimation);
}

function prodAnimation() {
  const isDesktop = isPC(); 
  const prodSections = toArray('.products');

  ScrollTrigger.getAll().forEach(trigger => trigger.kill());

  prodSections.forEach((section) => {
    const prodInner = section.querySelector('.inner');
    const prodVideoTitle = section.querySelector('.products-video-title');
    const prodVideoBx = section.querySelector('.products-video');
    const prodVideo = section.querySelector('video');
    const prodTextBx = section.querySelector('.products-textbx');
    const prodTextChildren = toArray(prodTextBx.children);

    if (isDesktop) {
      const prodTl = gsap.timeline({
        defaults: { ease: 'linear' },
      })
        .set(prodTextChildren, { opacity: 0, y: 20 }) 
        .to(prodVideoTitle, { opacity: 0, y: 20, duration: 3 })
        .call(() => prodVideo.play()) 
        .to(prodInner, { maxWidth: '1440px'}) 
        .to(prodVideoBx, { scale: 0.5083,x:(24/16)+'rem', borderRadius: 28, duration: 2 })
        .to(prodTextChildren, { opacity: 1, y: 0, stagger: 0.2 });

      ScrollTrigger.create({
        trigger: section,
        start: 'top',
        end: '+=1200',
        pin: true,
        scrub: true,
        animation: prodTl,
        onLeaveBack: () => {
          prodVideo.pause();
          prodVideo.currentTime = 0;
        },
      });
    } else {
      prodVideo.pause();
      prodVideo.currentTime = 0;
      gsap.set([prodTextChildren, prodVideoTitle, prodInner, prodVideoBx], { clearProps: 'all' });
    }
  });
}

function tabAnimation() {
  const tabList = toArray('.thinQ-tabs-imgbx-fixedimg-tablist li');
  const tabBg = toArray('.thinQ-tabs-imgbx-bgwrap picture');
  const tabCon = toArray('.thinQ-tabs-conbx-tabcon');
  
  let changeImg = tabBg.find(li => li.classList.contains('active'));
  let currentTimeline = null;

  tabList.forEach((tab, index) => {
    tab.addEventListener('click', () => {
      if (currentTimeline) currentTimeline.progress(1);

      const currentImg = changeImg.querySelector('img');

      tabList.forEach(t => {
        t.classList.remove('active')
        t.setAttribute('aria-selected','false');
      });
      tab.classList.add('active');
      tab.setAttribute('aria-selected','true');

      tabCon.forEach(con => {
        con.classList.remove('active');
        con.setAttribute('tabindex','-1');
      });
      tabCon[index].classList.add('active');
      tabCon[index].setAttribute('tabindex','0');

      currentTimeline = gsap.timeline()
      .to(currentImg, {borderRadius:'100%',scale:0,duration:1})
      .eventCallback('onComplete', () => {
        tabBg.forEach(bg => bg.classList.remove('active'));
        tabBg[index].classList.add('active');

        gsap.set(currentImg, {borderRadius:'0%',scale:1}); 
        changeImg = tabBg[index]; 

        currentTimeline = null;
      })
    })
  })
}

function handleResize() {
  console.log('resize' + isPC())
  const newIsMobile = !isPC(); 

  if (newIsMobile !== isMobile) {
    isMobile = newIsMobile;
    prodAnimation(); 
  }

  ScrollTrigger.refresh();
  overviewAnimation();
}

function init() {
  console.log('init')
  const sections = Array.from(toArray('section'), section => section.className);
  isMobile = !isPC();

  if (sections.includes('kv')) {
    kvAnimation();
  }
  if (sections.includes('products')) {
    prodAnimation();
  }
  if (sections.includes('overview')) {
    overviewAnimation();
  }
  if (sections.includes('thinQ-tabs')) {
    tabAnimation();
  }

  // 리사이즈 이벤트 처리
  window.addEventListener('resize', handleResize);
}

init();


