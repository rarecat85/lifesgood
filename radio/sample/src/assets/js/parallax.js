gsap.registerPlugin(ScrollTrigger);

// 반응형 설정
const RESPONSIVE = {
  desktop: {
    breakpoint: 1025,
    startPosition: 200, // 시작 위치
    endPosition: 120   // 최종 이동 위치
  },
  tablet: {
    breakpoint: 769,
    startPosition: 150,
    endPosition: 100
  },
  mobile: {
    breakpoint: 0,
    startPosition: 100,
    endPosition: 80
  }
};

// 현재 화면 크기에 따른 설정 가져오기
function getCurrentSettings() {
  const width = window.innerWidth;
  if (width >= RESPONSIVE.desktop.breakpoint) {
    return RESPONSIVE.desktop;
  } else if (width >= RESPONSIVE.tablet.breakpoint) {
    return RESPONSIVE.tablet;
  }
  return RESPONSIVE.mobile;
}

function parallax() {
  const parallaxContainer = document.querySelector(".parallax-container");
  const parallaxItems = gsap.utils.toArray(".parallax-item");
  const parallaxTxtBx = document.querySelector(".parallax-txt-bx");
  const parallaxLogo = document.querySelector(".parallax-txt-bx-logo");
  const parallaxRadioControls = document.querySelector(
    ".parallax-txt-bx-radio-controls"
  );
  const parallaxSticker = document.querySelector(
    ".parallax-txt-bx-logo-sticker"
  );
  const parallaxTitle = document.querySelector(".parallax-txt-bx-title");
  const parallaxRadioBtns = document.querySelector(".parallax-txt-bx-btns");
  const firstLine = document.querySelector(
    ".parallax-txt-bx-radio-controls-line:first-child"
  );
  const secondLine = document.querySelector(
    ".parallax-txt-bx-radio-controls-line:last-child"
  );

  // 초기 설정 가져오기
  const settings = getCurrentSettings();

  // 현재 스크롤 위치 확인하여 parallax 영역을 벗어났는지 체크
  const initialScrollY = window.scrollY;
  const containerRect = parallaxContainer.getBoundingClientRect();
  const containerTop = containerRect.top + initialScrollY;
  const containerBottom = containerTop + containerRect.height;
  const isOutsideParallaxArea = initialScrollY > containerBottom - 200;

  // 초기 위치 설정
  gsap.set(parallaxTxtBx, {
    position: "absolute",
    top: `${settings.startPosition}px`,
    opacity: 1,
    visibility: "visible"
  });

  // 새로고침 시 parallax 영역을 벗어났다면 요소들을 완료된 상태로 설정하되 숨김
  if (isOutsideParallaxArea) {
    // 모든 요소를 최종 상태로 설정 (하지만 화면에서는 숨김)
    gsap.set([parallaxLogo, parallaxSticker, parallaxTitle, parallaxRadioControls, parallaxRadioBtns], {
      opacity: 1
    });
    gsap.set(parallaxLogo, { y: 0 });
    gsap.set(parallaxSticker, { scale: 1 });
    gsap.set(parallaxTitle, { y: 0 });
    gsap.set(firstLine, { width: "calc(100% - 1rem)" });
    gsap.set(secondLine, { width: "0%" });
    
    // txt-bx를 화면에서 숨김
    gsap.set(parallaxTxtBx, {
      position: "absolute",
      top: `${containerBottom - containerTop}px`,
      opacity: 0,
      visibility: "hidden"
    });
  }

  // 최초 로딩 애니메이션 타임라인 (parallax 영역 밖에서 새로고침한 경우가 아닐 때만 실행)
  const introTimeline = isOutsideParallaxArea ? null : gsap.timeline({ delay: 0.5 });

  // parallax 영역 밖에서 새로고침한 경우가 아니라면 인트로 애니메이션 실행
  if (!isOutsideParallaxArea) {
    // 1. 로고 - 아래에서 나타나기
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
        "-=0.3" // 로고 애니메이션이 끝나기 0.3초 전에 시작
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
        "-=0.2" // 스티커 애니메이션이 끝나기 0.2초 전에 시작
      );
    // 4. 라디오 컨트롤 - 나타나기
    introTimeline
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
          width: "calc(100% - 1rem)", // rem(10) = 0.625rem ≈ 1rem
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
        "<" // 첫 번째 라인과 동시에 시작
      );
  }

  // Parallax 아이템 애니메이션
  const parallax = gsap.timeline({
    scrollTrigger: {
      trigger: parallaxContainer,
      start: "6%",
      end: "10%",
      scrub: true,
    },
  });

  parallax
    .to(parallaxItems[0], { y: "-8%" })
    .to(parallaxItems[1], { y: "-24%", x: "-2%" })
    .to(parallaxItems[2], { y: "-10%", scale: 1.05 });

  // txt-bx 애니메이션 - 통합 ScrollTrigger로 관리
  let currentState = "initial"; // 'initial', 'fixed', 'absolute'
  
  // 인트로 애니메이션 재생 함수
  function playIntroAnimation() {
    // 기존 애니메이션 중단
    gsap.killTweensOf([parallaxLogo, parallaxSticker, parallaxTitle, parallaxRadioControls, parallaxRadioBtns, firstLine, secondLine]);
    
    // 초기 상태로 리셋
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
        "-=0.3" // 로고 애니메이션이 끝나기 0.3초 전에 시작
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
        "-=0.2" // 스티커 애니메이션이 끝나기 0.2초 전에 시작
      );
    // 4. 라디오 컨트롤 - 나타나기
    newIntroTimeline
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
          width: "calc(100% - 1rem)", // rem(10) = 0.625rem ≈ 1rem
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
        "<" // 첫 번째 라인과 동시에 시작
      );
  }

  ScrollTrigger.create({
    trigger: "body",
    start: "top top",
    end: "bottom bottom",
    onUpdate: (self) => {
      const scrollY = window.scrollY;
      const settings = getCurrentSettings();
      
      // 시작 지점과 끝 지점의 합 계산
      const totalDistance = settings.startPosition + settings.endPosition;
      
      // 상태 결정
      let targetState;
      if (scrollY < settings.startPosition) {
        targetState = "initial";
      } else if (scrollY < totalDistance) {
        targetState = "fixed";
      } else {
        targetState = "absolute";
      }

      // 상태 변경 시에만 실행
      if (currentState !== targetState) {
        gsap.killTweensOf(parallaxTxtBx); // 기존 애니메이션 중단

        if (targetState === "initial") {
          gsap.set(parallaxTxtBx, {
            position: "absolute",
            top: `${settings.startPosition}px`,
            opacity: 1,
            visibility: "visible"
          });
        } else if (targetState === "fixed") {
          // 스크롤이 totalDistance보다 크면 totalDistance로 위치 지정
          const targetTop = scrollY > totalDistance ? totalDistance : settings.startPosition;
          
          gsap.set(parallaxTxtBx, {
            position: "fixed",
            top: `${targetTop}px`,
            opacity: 1,
            visibility: "visible"
          });

          // endPosition으로 부드럽게 이동 (빠른 스크롤 시에는 즉시)
          const duration =
            Math.abs(scrollY - (currentState === "initial" ? settings.startPosition : totalDistance)) > 50
              ? 0
              : 0.3;
          gsap.to(parallaxTxtBx, {
            top: `${settings.endPosition}px`,
            duration: duration,
            ease: "power2.out",
          });
        } else if (targetState === "absolute") {
          // fixed에서 absolute로 전환
          const containerRect = parallaxContainer.getBoundingClientRect();
          const containerTop = containerRect.top + scrollY;
          const containerBottom = containerTop + containerRect.height;
          
          // 스크롤이 totalDistance보다 크면 totalDistance를 사용
          const absoluteTop = scrollY > totalDistance ? totalDistance : scrollY + settings.endPosition - containerTop;

          // parallax 컨테이너 영역을 벗어났는지 체크
          if (scrollY > containerBottom - 200) {
            // txt-bx를 숨김
            gsap.set(parallaxTxtBx, {
              position: "absolute",
              top: `${containerBottom - containerTop}px`,
              opacity: 0,
              visibility: "hidden"
            });
          } else {
            // 정상적인 absolute 위치 설정
            gsap.set(parallaxTxtBx, {
              position: "absolute",
              top: `${absoluteTop}px`,
              opacity: 1,
              visibility: "visible"
            });
          }
        }

        currentState = targetState;
      }
    },
  });
  
  // 패럴랙스 영역 진입/이탈 감지를 위한 ScrollTrigger
  ScrollTrigger.create({
    trigger: parallaxContainer,
    start: "top bottom",
    end: "bottom top",
    onEnterBack: () => {
      // 패럴랙스 영역으로 다시 들어올 때 인트로 애니메이션 재생
      playIntroAnimation();
    }
  });
}

parallax();