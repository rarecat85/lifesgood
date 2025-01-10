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

function overviewAnimation() {
  const overviewSection = document.querySelector('.overview');
  const overviewTitle = document.querySelector('.overview-logo-title');
  const overviewLogo = document.querySelector('.overview-logo-img');
  const overviewDesc = document.querySelector('.overview-desc');
  let splitTextInstance; 
  let lines;

  function createSplitText() {
    if (splitTextInstance) {
      splitTextInstance.revert();
    }
    splitTextInstance = new SplitText(overviewDesc, { type: 'lines' });
    lines = splitTextInstance.lines;
    gsap.set(lines, { opacity: 0, y: 20 });
  }

  createSplitText();

  const overviewTL = gsap.timeline()
    .set(overviewTitle, {
      webkitMaskImage: "linear-gradient(to right, black 0%, black 0%, transparent 0%)",
      maskImage: "linear-gradient(to right, black 0%, black 0%, transparent 100%)",
      webkitMaskRepeat: "no-repeat",
      maskRepeat: "no-repeat",
    })
    .set(overviewLogo, { x: innerWidth / 2 - overviewLogo.offsetLeft, y: 20, opacity: 0 })
    .to(overviewLogo, { opacity: 1, y: 0, duration: 1 }) 
    .to(overviewLogo, { x: 0, duration: 1 }) 
    .to(overviewTitle, {
      webkitMaskImage: "linear-gradient(to right, black 100%, black 100%, transparent 100%)",
      maskImage: "linear-gradient(to right, black 100%, black 100%, transparent 100%)",
      duration: 1,
      ease: "power2.out"
    })
    .to(lines, { opacity: 1, y: 0, stagger: 0.2 }, '-=0.5');

  ScrollTrigger.create({
    trigger: overviewSection,
    start: 'top 80%',
    end: 'bottom 80%',
    animation: overviewTL,
    toggleActions: 'restart none none none', 
    onLeaveBack: () => {
      overviewTL.pause(0); 
    }
  });

  window.addEventListener('resize', () => createSplitText());
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
  const newIsMobile = isPC();

  kvAnimation();

  if (newIsMobile !== isMobile) {
    isMobile = newIsMobile;
  } else if (overviewAnimation) {
  }
}



function init() {
  const sections = Array.from(toArray('section'), section => section.className);
  isMobile = isPC();

  if(sections.includes('kv')) {
    kvAnimation()
  }
  if(sections.includes('overview')) {
    overviewAnimation()
  }
  if(sections.includes('thinQ-tabs')) {
    tabAnimation()
  }

  window.addEventListener('resize', handleResize);
}

init()


