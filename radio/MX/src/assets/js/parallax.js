gsap.registerPlugin(ScrollTrigger);

// 반응형 설정
const RESPONSIVE = {
  desktop4k: {
    breakpoint: 2560,
    startPosition: 200, // 시작 위치
    endPosition: 80   // 최종 이동 위치
  },
  desktop: {
    breakpoint: 1025,
    startPosition: 120, // 시작 위치
    endPosition: 80   // 최종 이동 위치
  },
  tablet: {
    breakpoint: 769,
    startPosition: 150,
    endPosition: 100
  },
  mobile: {
    breakpoint: 0,
    startPosition: 0,
    endPosition: 20
  }
};

// 현재 화면 크기에 따른 설정 가져오기
function getCurrentSettings() {
  const width = window.innerWidth;
  if (width >= RESPONSIVE.desktop4k.breakpoint) {
    return RESPONSIVE.desktop4k;
  } else if (width >= RESPONSIVE.desktop.breakpoint) {
    return RESPONSIVE.desktop;
  } else if (width >= RESPONSIVE.tablet.breakpoint) {
    return RESPONSIVE.tablet;
  }
  return RESPONSIVE.mobile;
}

function parallax() {
  const parallaxContainer = document.querySelector(".parallax-container");
  const parallaxItems = gsap.utils.toArray(".parallax-item");
  const parallaxLogo = document.querySelector(".parallax-txt-bx-logo");
  const parallaxSticker = document.querySelector(".parallax-txt-bx-logo-sticker");
  const parallaxTitle = document.querySelector(".parallax-txt-bx-title");
  const parallaxRadioControls = document.querySelector(".parallax-txt-bx-radio-controls");
  const parallaxRadioBtns = document.querySelector(".parallax-txt-bx-btns");
  const firstLine = document.querySelector(".parallax-txt-bx-radio-controls-line:first-child");
  const secondLine = document.querySelector(".parallax-txt-bx-radio-controls-line:last-child");

  // 인트로 애니메이션 재생 함수
  function playIntroAnimation() {
    // 기존 애니메이션 중단
    if (introTimeline) {
      introTimeline.kill();
    }

    // 요소들 초기 상태로 리셋
    gsap.set([parallaxLogo, parallaxSticker, parallaxTitle, parallaxRadioControls, parallaxRadioBtns], {
      opacity: 0
    });
    gsap.set(parallaxLogo, { y: 50 });
    gsap.set(parallaxSticker, { scale: 0 });
    gsap.set(parallaxTitle, { y: 30 });
    gsap.set(firstLine, { width: "0%" });
    gsap.set(secondLine, { width: "calc(100% - 1rem)" });

    // 인트로 애니메이션 재생
    const newIntroTimeline = gsap.timeline({ delay: 0.5 });
    
    // 1. 로고 - 아래에서 나타나기
    newIntroTimeline
      .fromTo(
        parallaxLogo,
        {
          opacity: 0,
          y: 50,
        },
        {
          opacity: 1,
          y: 0,
          duration: 0.5,
          ease: "power2.out",
        }
      )
      // 2. 스티커 - 띠용하고 나타나기 (scale + bounce)
      .fromTo(
        parallaxSticker,
        {
          opacity: 0,
          scale: 0,
        },
        {
          opacity: 1,
          scale: 1,
          duration: 0.6,
          ease: "elastic.out(1, 0.5)",
        },
        "-=0.3"
      )
      // 3. 타이틀 - 아래에서 나타나기
      .fromTo(
        parallaxTitle,
        {
          opacity: 0,
          y: 30,
        },
        {
          opacity: 1,
          y: 0,
          duration: 0.5,
          ease: "power2.out",
        },
        "-=0.2"
      )
      // 4. 라디오 컨트롤 - 나타나기
      .addLabel("radioControls", "-=0.3")
      .fromTo(
        [parallaxRadioControls, parallaxRadioBtns],
        {
          opacity: 0,
        },
        {
          opacity: 1,
          duration: 0.3,
          ease: "power2.out",
        },
        "radioControls"
      )
      // 5. 첫 번째 라인 - 0에서 현재값까지 확장
      .fromTo(
        firstLine,
        {
          width: "0%",
        },
        {
          width: "calc(100% - 1rem)",
          duration: 3.5,
          ease: "power1.out",
        },
        "-=0.1"
      )
      // 6. 두 번째 라인 - 현재값에서 0까지 축소
      .fromTo(
        secondLine,
        {
          width: "calc(100% - 1rem)",
        },
        {
          width: "0%",
          duration: 3.5,
          ease: "power1.out",
        },
        "<"
      )
      .to(
        parallaxRadioControls, {overflow: "unset"}
      );
  }

  // 최초 로딩 애니메이션 타임라인
  const introTimeline = gsap.timeline({ delay: 0.5 });

  // 인트로 애니메이션 실행
  introTimeline
    .fromTo(
      parallaxLogo,
      {
        opacity: 0,
        y: 50,
      },
      {
        opacity: 1,
        y: 0,
        duration: 0.5,
        ease: "power2.out",
      }
    )
    .fromTo(
      parallaxSticker,
      {
        opacity: 0,
        scale: 0,
      },
      {
        opacity: 1,
        scale: 1,
        duration: 0.6,
        ease: "elastic.out(1, 0.5)",
      },
      "-=0.3"
    )
    .fromTo(
      parallaxTitle,
      {
        opacity: 0,
        y: 30,
      },
      {
        opacity: 1,
        y: 0,
        duration: 0.5,
        ease: "power2.out",
      },
      "-=0.2"
    )
    .addLabel("radioControls", "-=0.3")
    .fromTo(
      [parallaxRadioControls, parallaxRadioBtns],
      {
        opacity: 0,
      },
      {
        opacity: 1,
        duration: 0.3,
        ease: "power2.out",
      },
      "radioControls"
    )
    .fromTo(
      firstLine,
      {
        width: "0%",
      },
      {
        width: "calc(100% - 1rem)",
        duration: 12,
        ease: "power1.out",
      },
      "-=0.1"
    )
    .fromTo(
      secondLine,
      {
        width: "calc(100% - 1rem)",
      },
      {
        width: "0%",
        duration: 12,
        ease: "power1.out",
      },
      "<"
    )
    .to(
      parallaxRadioControls, {overflow: "unset"}
    );

  // Parallax 아이템 애니메이션
  const parallax = gsap.timeline({
    scrollTrigger: {
      trigger: parallaxContainer,
      start: () => {
        const settings = getCurrentSettings();
        return `top+=${settings.startPosition} top`;
      },
      end: () => {
        const settings = getCurrentSettings();
        return `top+=${settings.startPosition + settings.endPosition} top`;
      },
      scrub: true,
    },
  });

  parallax
    .to(parallaxItems[0], { y: "-8%" })
    .to(parallaxItems[1], { y: "-24%", x: "-2%" })
    .to(parallaxItems[2], { y: "-10%", scale: 1.05 });
}

parallax();