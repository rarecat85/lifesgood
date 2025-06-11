gsap.registerPlugin(ScrollTrigger);

function parallax() {
  const parallaxContainer = document.querySelector('.parallax-container');
  const parallaxItems = gsap.utils.toArray('.parallax-item');
  const parallaxTxtBx = document.querySelector('.parallax-txt-bx');
  const parallaxLogo = document.querySelector('.parallax-txt-bx-logo');
  const parallaxRadioControls = document.querySelector('.parallax-txt-bx-radio-controls');
  const parallaxSticker = document.querySelector('.parallax-txt-bx-logo-sticker');
  const parallaxTitle = document.querySelector('.parallax-txt-bx-title');
  const parallaxRadioBtns = document.querySelector('.parallax-txt-bx-btns');
  const firstLine = document.querySelector('.parallax-txt-bx-radio-controls-line:first-child');
  const secondLine = document.querySelector('.parallax-txt-bx-radio-controls-line:last-child');

  // 최초 로딩 애니메이션 타임라인
  const introTimeline = gsap.timeline({ delay: 0.5 });
  
    // 1. 로고 - 아래에서 나타나기
  introTimeline.fromTo(parallaxLogo, 
    { 
      opacity: 0, 
      y: 50 
    },
    { 
      opacity: 1, 
      y: 0, 
      duration: 0.5, 
      ease: "power2.out" 
    }
  )
  // 2. 스티커 - 띠용하고 나타나기 (scale + bounce)
  .fromTo(parallaxSticker,
    {
      opacity: 0,
      scale: 0
    },
    {
      opacity: 1,
      scale: 1,
      duration: 0.6,
      ease: "elastic.out(1, 0.5)"
    },
    "-=0.3" // 로고 애니메이션이 끝나기 0.3초 전에 시작
  )
  // 3. 타이틀 - 아래에서 나타나기
  .fromTo(parallaxTitle,
    {
      opacity: 0,
      y: 30
    },
    {
      opacity: 1,
      y: 0,
      duration: 0.5,
      ease: "power2.out"
    },
    "-=0.2" // 스티커 애니메이션이 끝나기 0.2초 전에 시작
  )
   // 4. 라디오 컨트롤 - 나타나기
   introTimeline.addLabel("radioControls", "-=0.3")
   .fromTo([parallaxRadioControls, parallaxRadioBtns],
     {
       opacity: 0
     },
     {
       opacity: 1,
       duration: 0.3,
       ease: "power2.out"
     },
     "radioControls"
   )
   // 5. 첫 번째 라인 - 0에서 현재값까지 확장
   .fromTo(firstLine,
     {
       width: "0%"
     },
     {
       width: "calc(100% - 1rem)", // rem(10) = 0.625rem ≈ 1rem
       duration: 3.5,
       ease: "power1.out"
     },
     "-=0.1"
   )
   // 6. 두 번째 라인 - 현재값에서 0까지 축소
   .fromTo(secondLine,
     {
       width: "calc(100% - 1rem)"
     },
     {
       width: "0%",
       duration: 3.5,
       ease: "power1.out"
     },
     "<" // 첫 번째 라인과 동시에 시작
   );

  // Parallax 아이템 애니메이션
  const parallax = gsap.timeline({
    scrollTrigger:{
      trigger: parallaxContainer,
      start: '6%',
      end: '10%',
      scrub: true,
    }
  });

  parallax
  .to(parallaxItems[0], {y: "-8%"})
  .to(parallaxItems[1], {y: "-24%", x: "-2%"})
  .to(parallaxItems[2], {y: "-10%", scale: 1.05});

  // txt-bx 애니메이션 - 통합 ScrollTrigger로 관리
  let currentState = 'initial'; // 'initial', 'fixed', 'absolute'
  
  ScrollTrigger.create({
    trigger: "body",
    start: "top top",
    end: "bottom bottom",
    onUpdate: (self) => {
      const scrollY = window.scrollY;
      
      // 상태 결정
      let targetState;
      if (scrollY < 120) {
        targetState = 'initial';
      } else if (scrollY < 200) {
        targetState = 'fixed';
      } else {
        targetState = 'absolute';
      }
      
      // 상태 변경 시에만 실행
      if (currentState !== targetState) {
        gsap.killTweensOf(parallaxTxtBx); // 기존 애니메이션 중단
        
        if (targetState === 'initial') {
          gsap.set(parallaxTxtBx, {
            position: "absolute",
            top: "200px"
          });
        } 
        else if (targetState === 'fixed') {
          // 현재 위치 계산
          const rect = parallaxTxtBx.getBoundingClientRect();
          const currentScreenTop = rect.top;
          
          gsap.set(parallaxTxtBx, {
            position: "fixed",
            top: `${currentScreenTop}px`
          });
          
          // 120px로 부드럽게 이동 (빠른 스크롤 시에는 즉시)
          const duration = Math.abs(scrollY - (currentState === 'initial' ? 120 : 200)) > 50 ? 0 : 0.3;
          gsap.to(parallaxTxtBx, {
            top: "120px",
            duration: duration,
            ease: "power2.out"
          });
        } 
        else if (targetState === 'absolute') {
          // fixed에서 absolute로 전환
          const containerRect = parallaxContainer.getBoundingClientRect();
          const containerTop = containerRect.top + scrollY;
          const absoluteTop = scrollY + 120 - containerTop;
          
          gsap.set(parallaxTxtBx, {
            position: "absolute",
            top: `${absoluteTop}px`
          });
        }
        
        currentState = targetState;
      }
    }
  });
}

parallax();