// GSAP Plugin Registration
gsap.registerPlugin(ScrollTrigger);

// Resize 시 ScrollTrigger 재계산
window.addEventListener('resize', () => {
  ScrollTrigger.refresh();
});

// Keyvisual Scroll Interaction
const keyvisualSection = document.querySelector('.sustainability-keyvisual');
const keyvisualOverlay = document.querySelector('.keyvisual-overlay');
const keyvisualOverlayTitle = document.querySelector('.keyvisual-overlay-title');
const keyvisualOverlayDesc = document.querySelector('.keyvisual-overlay-desc');

if (keyvisualSection) {
  const tl = gsap.timeline({
    scrollTrigger: {
      trigger: keyvisualSection,
      start: 'top top',
      end: '+=200%',
      pin: true,
      scrub: 1,
    }
  });

  // 1. 블러 오버레이 원형으로 확장 + opacity
  tl.to(keyvisualOverlay, {
    clipPath: 'circle(150% at 50% 50%)',
    opacity: 1,
    duration: 0.5,
    ease: 'power2.out',
  });

  // 2. 타이틀 아래에서 위로 등장
  tl.to(keyvisualOverlayTitle, {
    opacity: 1,
    y: 0,
    duration: 0.4,
  });

  // 3. 설명 텍스트 아래에서 위로 등장
  tl.to(keyvisualOverlayDesc, {
    opacity: 1,
    y: 0,
    duration: 0.4,
  });

  // 초기 상태 설정
  gsap.set(keyvisualOverlayTitle, { y: 50 });
  gsap.set(keyvisualOverlayDesc, { y: 50 });
}

// Keyvisual Video Play/Pause
const keyvisualVideo = document.querySelector('.keyvisual-video');
const keyvisualVideoBtn = document.querySelector('.keyvisual-video-btn');

if (keyvisualVideo && keyvisualVideoBtn) {
  keyvisualVideoBtn.addEventListener('click', function() {
    if (keyvisualVideo.paused) {
      keyvisualVideo.play();
      keyvisualVideoBtn.classList.remove('is-paused');
      keyvisualVideoBtn.setAttribute('aria-label', 'Pause video');
    } else {
      keyvisualVideo.pause();
      keyvisualVideoBtn.classList.add('is-paused');
      keyvisualVideoBtn.setAttribute('aria-label', 'Play video');
    }
  });
}

// Overview Section Entrance Animation
const overviewSection = document.querySelector('.sustainability-overview');

if (overviewSection) {
  ScrollTrigger.create({
    trigger: overviewSection,
    start: 'top 70%',
    onEnter: () => {
      overviewSection.classList.add('is-animated');
    },
    onLeaveBack: () => {
      overviewSection.classList.remove('is-animated');
    }
  });
}

// Sticky Bar Scroll Interaction
const stickyBar = document.querySelector('.sustainability-sticky-bar');
const nextSection = document.querySelector('.sustainability-overview + section'); // overview 다음 섹션
const stickyNavLinks = document.querySelectorAll('.sticky-bar-nav-list a');

if (stickyBar && overviewSection) {
  let isSticky = false;
  let isExpanded = false;
  
  // CTA 링크 요소
  const ctaLink = stickyBar.querySelector('.sticky-bar-cta-link');
  
  // sticky bar의 overview 섹션 내 위치 계산 (페이지 기준)
  const overviewTop = overviewSection.getBoundingClientRect().top + window.scrollY;
  const stickyBarTop = stickyBar.getBoundingClientRect().top + window.scrollY;
  const stickyBarOffsetFromOverview = stickyBarTop - overviewTop;

  // 각 섹션에 대한 active 상태 관리
  const sections = [
    { id: 'achievement', element: document.querySelector('#achievement') },
    { id: 'eco-products', element: document.querySelector('#eco-products') },
    { id: 'accessibility', element: document.querySelector('#accessibility') },
    { id: 'news', element: document.querySelector('#news') },
    { id: 'explore', element: document.querySelector('#explore') }
  ];

  // 스티키 메뉴 링크 클릭 시 부드럽게 스크롤
  stickyNavLinks.forEach((link) => {
    link.addEventListener('click', function(e) {
      e.preventDefault();
      const targetId = this.getAttribute('href').substring(1);
      const targetSection = sections.find(s => s.id === targetId);
      
      if (targetSection && targetSection.element) {
        const targetTop = targetSection.element.getBoundingClientRect().top + window.scrollY;
        const offset = 100; // 스티키 메뉴 높이 고려한 오프셋
        
        window.scrollTo({
          top: targetTop - offset,
          behavior: 'smooth'
        });
      }
    });
  });

  // 각 섹션에 ScrollTrigger 생성하여 active 상태 관리
  sections.forEach((section) => {
    if (section.element) {
      ScrollTrigger.create({
        trigger: section.element,
        start: 'top 20%',
        end: 'bottom 20%',
        onEnter: () => {
          // 해당 섹션의 링크에 active 클래스 추가, 다른 링크는 제거
          stickyNavLinks.forEach((link) => {
            if (link.getAttribute('href') === `#${section.id}`) {
              link.classList.add('is-active');
            } else {
              link.classList.remove('is-active');
            }
          });
        },
        onEnterBack: () => {
          // 위로 스크롤해서 다시 들어올 때도 active 설정
          stickyNavLinks.forEach((link) => {
            if (link.getAttribute('href') === `#${section.id}`) {
              link.classList.add('is-active');
            } else {
              link.classList.remove('is-active');
            }
          });
        },
        onLeave: () => {
          // 아래로 스크롤해서 섹션을 벗어날 때만 active 제거 (다음 섹션이 활성화되면 자동으로 제거됨)
          // 작은 섹션의 경우를 위해 제거하지 않고 다음 섹션이 활성화될 때 제거되도록 함
        },
        onLeaveBack: () => {
          // 위로 스크롤해서 벗어날 때만 active 제거 (이전 섹션이 활성화되면 자동으로 제거됨)
        }
      });
    }
  });

  // 1단계: sticky bar가 상단에 도달하면 sticky만 됨 (펼쳐지지 않음)
  // trigger를 overview 섹션으로 하여 sticky bar가 fixed가 되어도 트리거 위치 유지
  ScrollTrigger.create({
    trigger: overviewSection,
    start: `top+=${stickyBarOffsetFromOverview} top+=16`,
    endTrigger: 'body',
    end: 'bottom bottom',
    onEnter: () => {
      stickyBar.classList.add('is-sticky');
      if (ctaLink) ctaLink.classList.add('change');
      isSticky = true;
    },
    onLeaveBack: () => {
      // 원래 자리로 돌아오면 sticky 해제
      stickyBar.classList.remove('is-sticky');
      if (ctaLink) ctaLink.classList.remove('change');
      isSticky = false;
    }
  });

  // 2단계: 다음 섹션 진입 시 펼쳐짐 (다음 섹션이 화면 상단에 도달)
  if (nextSection) {
    ScrollTrigger.create({
      trigger: nextSection,
      start: 'top top',
      onEnter: () => {
        stickyBar.classList.add('is-expanded');
        isExpanded = true;
      },
      onLeaveBack: () => {
        // overview 영역으로 돌아오면 메뉴 접기
        stickyBar.classList.remove('is-expanded');
        isExpanded = false;
      }
    });
  }

  // KV 영역으로 돌아갈 때 처리
  if (keyvisualSection) {
    ScrollTrigger.create({
      trigger: keyvisualSection,
      start: 'bottom top+=100',
      onEnterBack: () => {
        // KV로 돌아가면 메뉴만 접기 (sticky는 1단계에서 해제됨)
        stickyBar.classList.remove('is-expanded');
        isExpanded = false;
      }
    });
  }
}

// Achievement Section Interaction
const achievementSection = document.querySelector('.sustainability-achievement');
const achievementCards = document.querySelectorAll('.achievement-card');

if (achievementSection && achievementCards.length > 0) {
  // 배경 채우기 방향 설정 (상하좌우 순환)
  const directions = ['from-top', 'from-right', 'from-bottom', 'from-left'];
  
  achievementCards.forEach((card, index) => {
    // 각 카드에 방향 클래스 부여
    const direction = directions[index % 4];
    card.classList.add(direction);
  });

  // 숫자 카운팅 함수
  function countUp(element, target, duration = 1500) {
    const start = 0;
    const startTime = performance.now();
    
    // 숫자에서 실제 값 추출 ($ 기호, 소수점 등 처리)
    const hasPrefix = target.startsWith('$');
    const numericValue = parseFloat(target.replace(/[^0-9.]/g, ''));
    const hasDecimal = target.includes('.');
    const decimalPlaces = hasDecimal ? (target.split('.')[1] || '').replace(/[^0-9]/g, '').length : 0;
    
    function update(currentTime) {
      const elapsed = currentTime - startTime;
      const progress = Math.min(elapsed / duration, 1);
      
      // easeOutQuart
      const easeProgress = 1 - Math.pow(1 - progress, 4);
      const currentValue = start + (numericValue - start) * easeProgress;
      
      let displayValue = hasDecimal 
        ? currentValue.toFixed(decimalPlaces) 
        : Math.floor(currentValue).toString();
      
      if (hasPrefix) {
        displayValue = '$' + displayValue;
      }
      
      element.textContent = displayValue;
      
      if (progress < 1) {
        requestAnimationFrame(update);
      }
    }
    
    requestAnimationFrame(update);
  }

  // 각 카드의 원본 숫자값 저장
  const originalValues = [];
  achievementCards.forEach((card) => {
    const valueNumber = card.querySelector('.value-number');
    if (valueNumber) {
      originalValues.push(valueNumber.textContent);
    } else {
      originalValues.push(null);
    }
  });

  // ScrollTrigger로 애니메이션 시작
  ScrollTrigger.create({
    trigger: achievementSection,
    start: 'top 40%',
    onEnter: () => {
      // 모든 카드 동시에 애니메이션 적용
      achievementCards.forEach((card, index) => {
        card.classList.add('is-animated');
        
        // 숫자 카운팅 시작 (배경 채워진 후)
        const valueNumber = card.querySelector('.value-number');
        if (valueNumber && originalValues[index]) {
          valueNumber.textContent = '0';
          setTimeout(() => {
            countUp(valueNumber, originalValues[index], 1500);
          }, 600); // 배경 애니메이션 완료 후 카운팅 시작
        }
      });
    },
    onLeaveBack: () => {
      // 위로 스크롤해서 벗어나면 초기화
      achievementCards.forEach((card, index) => {
        card.classList.remove('is-animated');
        const valueNumber = card.querySelector('.value-number');
        if (valueNumber && originalValues[index]) {
          valueNumber.textContent = originalValues[index];
        }
      });
    }
  });
}

// ESG Data Grid Scroll Interaction
const esgSection = document.querySelector('.sustainability-esg-data');
const esgItems = document.querySelectorAll('.esg-grid-item');

if (esgSection && esgItems.length > 0) {
  const spreadDistance = 300; // 펼쳐지는 거리

  // 각 박스의 초기 위치 설정 (펼쳐진 상태)
  gsap.set('.item-1', { x: -250, y: -250 });
  gsap.set('.item-2', { y: -spreadDistance });
  gsap.set('.item-3', { x: 0, y: -200 });
  gsap.set('.item-4', { x: 200, y: -100 });
  gsap.set('.item-5', { x: -150, y: 50 });
  gsap.set('.item-6', { x: 50, y: -150 });
  gsap.set('.item-7', { x: -50, y: -100 });
  gsap.set('.item-8', { x: 100, y: -50 });
  gsap.set('.item-9', { x: 150, y: 100 });

  const esgTl = gsap.timeline({
    scrollTrigger: {
      trigger: esgSection,
      start: 'top top',
      end: '+=150%',
      pin: true,
      scrub: 1,
    }
  });

  // 모든 박스를 원래 위치로 애니메이션
  esgTl.to('.item-1', { x: 0, y: 0, duration: 1, ease: 'power2.out' }, 0);
  esgTl.to('.item-2', { y: 0, duration: 1, ease: 'power2.out' }, 0);
  esgTl.to('.item-3', { x: 0, y: 0, duration: 1, ease: 'power2.out' }, 0);
  esgTl.to('.item-4', { x: 0, y: 0, duration: 1, ease: 'power2.out' }, 0);
  esgTl.to('.item-5', { x: 0, y: 0, duration: 1, ease: 'power2.out' }, 0);
  esgTl.to('.item-6', { x: 0, y: 0, duration: 1, ease: 'power2.out' }, 0);
  esgTl.to('.item-7', { x: 0, y: 0, duration: 1, ease: 'power2.out' }, 0);
  esgTl.to('.item-8', { x: 0, y: 0, duration: 1, ease: 'power2.out' }, 0);
  esgTl.to('.item-9', { x: 0, y: 0, duration: 1, ease: 'power2.out' }, 0);
}

// Vision Section - 카드 순환 인터랙션
const visionSection = document.querySelector('.sustainability-vision');
const visionItems = document.querySelectorAll('.vision-image-item');

if (visionSection && visionItems.length > 0) {
  const cardHeight = 270;
  const gap = 60;
  const step = cardHeight + gap; // 각 카드 간 간격
  const centerY = 215; // 컨테이너 가운데 (700 - 270) / 2
  const totalCards = visionItems.length;
  
  // 마지막 카드가 가운데에 올 때까지의 이동량 계산
  // 첫 번째 카드가 centerY - step 위치, 마지막 카드가 centerY 위치가 되려면
  // 마지막 카드의 초기 위치: centerY + (totalCards - 2) * step
  // 마지막 카드가 centerY로 오려면: (totalCards - 2) * step 만큼 이동
  const totalScrollDistance = (totalCards - 2) * step;
  
  // end 값을 동적으로 계산 (뷰포트 높이 기준 백분율)
  const scrollEndPercent = Math.round((totalScrollDistance / window.innerHeight) * 100) + 100; // 여유분 추가

  // 카드 위치 업데이트 함수
  function updateVisionCards(progress) {
    // 시작 딜레이 적용 (처음 10%는 대기)
    const delayRatio = 0.1;
    const adjustedProgress = Math.max(0, (progress - delayRatio) / (1 - delayRatio));
    
    const scrollAmount = adjustedProgress * totalScrollDistance;

    visionItems.forEach((card, index) => {
      // 각 카드의 y 위치 (가운데 기준으로 계산)
      const baseY = centerY + (index - 1) * step;
      const y = baseY - scrollAmount;

      // 가운데 위치와의 거리에 따라 기울기 결정
      const distanceFromCenter = y - centerY;
      const maxTilt = 10;
      let rotation = 0;
      let origin = 'center';

      if (distanceFromCenter < -step / 2) {
        // 위쪽에 있음 (양수 기울기)
        rotation = Math.min(maxTilt, Math.abs(distanceFromCenter) / step * maxTilt);
        origin = 'right bottom';
      } else if (distanceFromCenter > step / 2) {
        // 아래쪽에 있음 (음수 기울기)
        rotation = -Math.min(maxTilt, Math.abs(distanceFromCenter) / step * maxTilt);
        origin = 'right top';
      }

      // 화면 밖으로 나가면 페이드아웃
      let opacity = 1;
      if (y < -cardHeight) {
        opacity = 0;
      } else if (y < 0) {
        opacity = (y + cardHeight) / cardHeight;
      }

      // z-index는 가운데에 가까울수록 높게
      const zIndex = Math.round(totalCards - Math.abs(distanceFromCenter) / step);

      gsap.set(card, {
        y: y,
        rotation: rotation,
        transformOrigin: origin,
        opacity: opacity,
        zIndex: zIndex,
      });
    });
  }

  // 초기 상태 설정
  updateVisionCards(0);

  // ScrollTrigger (마지막 카드가 가운데에 올 때까지)
  ScrollTrigger.create({
    trigger: visionSection,
    start: 'top top',
    end: `+=${scrollEndPercent}%`,
    pin: true,
    scrub: 1,
    onUpdate: (self) => {
      updateVisionCards(self.progress);
    }
  });
}

// Products Section - Swiper & Tab Navigation
const productsSwiper = document.querySelector('.products-swiper');
const productsTabs = document.querySelectorAll('.products-tab-btn');

if (productsSwiper && productsTabs.length > 0) {
  // 마지막 카테고리의 첫 번째 슬라이드 인덱스 찾기
  const slides = document.querySelectorAll('.products-swiper .swiper-slide');
  let maxSlideIndex = slides.length - 1;
  
  // 마지막 카테고리(biodiversity)의 첫 번째 슬라이드 인덱스 찾기
  for (let i = 0; i < slides.length; i++) {
    if (slides[i].dataset.category === 'biodiversity') {
      maxSlideIndex = i;
      break;
    }
  }

  // 각 카테고리의 첫 번째 슬라이드 인덱스 맵 생성
  const categoryFirstIndexMap = {};
  const allCategories = [];
  slides.forEach((slide, index) => {
    const category = slide.dataset.category;
    if (!categoryFirstIndexMap[category]) {
      categoryFirstIndexMap[category] = index;
      allCategories.push(category);
    }
  });

  // 현재 슬라이드 인덱스에 해당하는 카테고리 찾기
  function getCategoryForSlideIndex(slideIndex) {
    // 각 카테고리의 첫 번째 슬라이드 인덱스를 확인
    for (let i = allCategories.length - 1; i >= 0; i--) {
      const category = allCategories[i];
      const firstIndex = categoryFirstIndexMap[category];
      
      // 다음 카테고리의 첫 번째 인덱스 찾기
      let nextCategoryFirstIndex = slides.length;
      if (i < allCategories.length - 1) {
        nextCategoryFirstIndex = categoryFirstIndexMap[allCategories[i + 1]];
      }
      
      // 현재 슬라이드가 이 카테고리 범위에 있는지 확인
      if (slideIndex >= firstIndex && slideIndex < nextCategoryFirstIndex) {
        return category;
      }
    }
    return allCategories[0]; // 기본값
  }

  // 탭 활성화 함수
  function activateTabForCategory(category) {
    productsTabs.forEach((tab) => {
      if (tab.dataset.target === category) {
        productsTabs.forEach((t) => t.classList.remove('is-active'));
        tab.classList.add('is-active');
      }
    });
  }

  // 네비게이션 버튼 요소
  const prevBtn = document.querySelector('.products-slider-prev');
  const nextBtn = document.querySelector('.products-slider-next');

  // Swiper 초기화
  const swiper = new Swiper('.products-swiper', {
    slidesPerView: 'auto',
    spaceBetween: 20,
    slidesOffsetAfter: 900,
    navigation: {
      prevEl: '.products-slider-prev',
      nextEl: '.products-slider-next',
    },
    on: {
      slideChange: function() {
        // 마지막 카테고리의 첫 번째 슬라이드를 넘어가면 되돌리기
        if (this.activeIndex > maxSlideIndex) {
          this.slideTo(maxSlideIndex, 300);
          return;
        }
        
        // 네비게이션 버튼 상태 업데이트 (기존 로직과 동일하게)
        // biodiversity의 첫 번째 슬라이드가 1번 위치에 오면 더 이상 next 불가
        if (nextBtn) {
          if (this.activeIndex >= maxSlideIndex) {
            nextBtn.disabled = true;
            nextBtn.classList.add('swiper-button-disabled');
          } else {
            nextBtn.disabled = false;
            nextBtn.classList.remove('swiper-button-disabled');
          }
        }
        if (prevBtn) {
          if (this.activeIndex === 0) {
            prevBtn.disabled = true;
            prevBtn.classList.add('swiper-button-disabled');
          } else {
            prevBtn.disabled = false;
            prevBtn.classList.remove('swiper-button-disabled');
          }
        }
        
        // 현재 1번 위치에 있는 슬라이드의 카테고리 확인
        const currentSlide = slides[this.activeIndex];
        if (currentSlide) {
          const currentCategory = currentSlide.dataset.category;
          // 해당 카테고리에 맞는 탭 활성화
          activateTabForCategory(currentCategory);
        }
      }
    }
  });

  // 초기 네비게이션 버튼 상태 설정
  if (nextBtn) {
    if (swiper.activeIndex >= maxSlideIndex) {
      nextBtn.disabled = true;
      nextBtn.classList.add('swiper-button-disabled');
    } else {
      nextBtn.disabled = false;
      nextBtn.classList.remove('swiper-button-disabled');
    }
  }
  if (prevBtn) {
    if (swiper.activeIndex === 0) {
      prevBtn.disabled = true;
      prevBtn.classList.add('swiper-button-disabled');
    } else {
      prevBtn.disabled = false;
      prevBtn.classList.remove('swiper-button-disabled');
    }
  }

  // 탭 클릭 시 해당 카테고리의 첫 번째 슬라이드로 이동
  productsTabs.forEach((tab) => {
    tab.addEventListener('click', function() {
      // 활성화 상태 변경
      productsTabs.forEach((t) => t.classList.remove('is-active'));
      this.classList.add('is-active');

      // 해당 카테고리의 첫 번째 슬라이드 찾기
      const targetCategory = this.dataset.target;
      
      for (let i = 0; i < slides.length; i++) {
        if (slides[i].dataset.category === targetCategory) {
          swiper.slideTo(i);
          break;
        }
      }
    });
  });
}

// Explore Section - Tab Navigation
const exploreSection = document.querySelector('.sustainability-explore');
const exploreTabs = document.querySelectorAll('.explore-tab-btn');
const explorePanels = document.querySelectorAll('.explore-content-panel');

if (exploreSection && exploreTabs.length > 0) {
  exploreTabs.forEach((tab) => {
    tab.addEventListener('click', function() {
      // 탭 활성화 상태 변경
      exploreTabs.forEach((t) => t.classList.remove('is-active'));
      this.classList.add('is-active');

      // 해당 탭의 콘텐츠 패널 표시
      const targetPanel = this.dataset.target;
      explorePanels.forEach((panel) => {
        if (panel.dataset.panel === targetPanel) {
          panel.classList.add('is-active');
        } else {
          panel.classList.remove('is-active');
        }
      });
    });
  });
}

// Accessibility Section - 아코디언 메뉴 & 이미지 슬라이드
const accessibilitySection = document.querySelector('.sustainability-accessibility');
const accessibilityMenuItems = document.querySelectorAll('.accessibility-menu-item');
const accessibilitySlides = document.querySelectorAll('.visual-slide');
const accessibilityPrevBtn = document.querySelector('.accessibility-pagination .pagination-prev');
const accessibilityNextBtn = document.querySelector('.accessibility-pagination .pagination-next');

if (accessibilitySection && accessibilityMenuItems.length > 0) {
  let currentIndex = 0;
  const totalItems = accessibilityMenuItems.length;

  // 메뉴 아이템 클릭 시 탭 전환
  function switchTab(newIndex, direction = 'next') {
    if (newIndex === currentIndex) return;

    const prevIndex = currentIndex;
    currentIndex = newIndex;

    // 메뉴 아이템 활성화 상태 변경
    accessibilityMenuItems.forEach((item, index) => {
      if (index === currentIndex) {
        item.classList.add('is-active');
      } else {
        item.classList.remove('is-active');
      }
    });

    // 이미지 슬라이드 전환
    const currentSlide = accessibilitySlides[currentIndex];
    
    // 이전 클래스 제거
    currentSlide.classList.remove('is-active', 'is-entering-prev', 'is-entering-next', 'from-right');

    // transition 비활성화 후 초기 위치 설정
    currentSlide.style.transition = 'none';
    currentSlide.style.zIndex = '3';
    
    if (direction === 'next') {
      // next: 우측에서 좌측으로 덮어씌움
      currentSlide.style.clipPath = 'inset(0 0 0 100%)';
    } else {
      // prev: 좌측에서 우측으로 덮어씌움
      currentSlide.style.clipPath = 'inset(0 100% 0 0)';
    }
    
    // 강제 리플로우 후 transition 활성화 및 애니메이션 시작
    currentSlide.offsetHeight;
    currentSlide.style.transition = 'clip-path 0.8s cubic-bezier(0.4, 0, 0.2, 1)';
    currentSlide.style.clipPath = 'inset(0 0 0 0)';
    
    // 애니메이션 완료 후 is-active로 전환
    setTimeout(() => {
      currentSlide.style.clipPath = '';
      currentSlide.style.zIndex = '';
      currentSlide.style.transition = '';
      currentSlide.classList.add('is-active');
      
      // 이전 슬라이드의 is-active 제거
      if (prevIndex !== currentIndex) {
        accessibilitySlides[prevIndex].classList.remove('is-active');
      }
    }, 800);

    // 페이지네이션 버튼 상태 업데이트
    updatePaginationButtons();
  }

  // 페이지네이션 버튼 상태 업데이트
  function updatePaginationButtons() {
    if (accessibilityPrevBtn) {
      accessibilityPrevBtn.disabled = currentIndex === 0;
    }
    if (accessibilityNextBtn) {
      accessibilityNextBtn.disabled = currentIndex === totalItems - 1;
    }
  }

  // 메뉴 아이템 클릭 이벤트
  accessibilityMenuItems.forEach((item, index) => {
    item.addEventListener('click', () => {
      // 클릭한 메뉴가 현재보다 위에 있으면 prev, 아래면 next
      const direction = index < currentIndex ? 'prev' : 'next';
      switchTab(index, direction);
    });
  });

  // 이전 버튼 클릭
  if (accessibilityPrevBtn) {
    accessibilityPrevBtn.addEventListener('click', () => {
      if (currentIndex > 0) {
        switchTab(currentIndex - 1, 'prev');
      }
    });
  }

  // 다음 버튼 클릭
  if (accessibilityNextBtn) {
    accessibilityNextBtn.addEventListener('click', () => {
      if (currentIndex < totalItems - 1) {
        switchTab(currentIndex + 1, 'next');
      }
    });
  }

  // 초기 상태 설정
  updatePaginationButtons();
}

// Layer Popup
const layer = document.querySelector('.sustainability-layer');
const layerDimmed = document.querySelector('.layer-dimmed');
const layerCloseBtn = document.querySelector('.layer-close-btn');
const layerTitleArea = document.querySelector('.layer-title-area');
const layerContent = document.querySelector('.layer-content');
const layerContainer = document.querySelector('.layer-container');
const layerFooter = document.querySelector('.layer-footer');

let savedScrollPosition = 0;

// Energy efficiency 레이어 그룹 정의
const energyLayerGroup = {
  tabs: [
    { id: 'energy-washing', label: 'Washing Machines' },
    { id: 'energy-refrigerator', label: 'Refrigerators' },
    { id: 'energy-smart-cottage', label: 'Smart Cottage' }
  ],
  title: '<p>Products for the planet</p><h2>Energy efficiency</h2>'
};

// 레이어 푸터 버튼 정의
const layerFooterButtons = [
  { id: 'circularity', label: 'Circularity', layerId: 'circularity', layerTitle: '<p>Products for the planet</p><h2>Circularity</h2>' },
  { id: 'home-environment', label: 'Home environment', layerId: 'home-environment', layerTitle: '<p>Products for the planet</p><h2>Home environment</h2>' },
  { id: 'biodiversity', label: 'Biodiversity', layerId: 'biodiversity', layerTitle: '<p>Products for the planet</p><h2>Biodiversity</h2>' }
];

// 레이어 열기 함수 (data-layer-id 방식)
function openLayerById(layerId, title, isTransition = false) {
  if (!layer || !layerTitleArea || !layerContent || !layerContainer) return;

  // 템플릿 영역에서 해당 layerId 찾기
  const layerTemplates = layer.querySelector('.layer-templates');
  if (!layerTemplates) {
    console.error('레이어 템플릿 영역을 찾을 수 없습니다.');
    return;
  }

  const template = layerTemplates.querySelector(`[data-layer-id="${layerId}"]`);
  if (!template) {
    console.error(`레이어 템플릿을 찾을 수 없습니다: ${layerId}`);
    return;
  }

  // Energy efficiency 그룹인지 확인
  const isEnergyLayer = layerId.startsWith('energy-');
  const layerTabsArea = layer.querySelector('.layer-tabs-area');

  // 타이틀 설정
  if (title) {
    layerTitleArea.innerHTML = title;
  } else if (isEnergyLayer) {
    layerTitleArea.innerHTML = energyLayerGroup.title;
  } else {
    layerTitleArea.innerHTML = '';
  }

  // h2 요소에 heading 클래스 추가
  const h2Element = layerTitleArea.querySelector('h2');
  if (h2Element) {
    h2Element.classList.add('heading');
  }

  // 탭 네비게이션 설정 (Energy efficiency 그룹인 경우)
  if (isEnergyLayer && layerTabsArea) {
    const tabsHtml = `
      <ul class="layer-tabs-list">
        ${energyLayerGroup.tabs.map(tab => `
          <li>
            <button type="button" class="layer-tab-btn ${tab.id === layerId ? 'is-active' : ''}" 
                    data-layer-id="${tab.id}">
              ${tab.label}
            </button>
          </li>
        `).join('')}
      </ul>
    `;
    layerTabsArea.innerHTML = tabsHtml;
    
    // 탭 버튼에 이벤트 리스너 직접 바인딩
    const tabButtons = layerTabsArea.querySelectorAll('.layer-tab-btn');
    tabButtons.forEach(btn => {
      btn.addEventListener('click', (e) => {
        e.preventDefault();
        e.stopPropagation();
        const clickedLayerId = btn.getAttribute('data-layer-id');
        const clickedLayerTitle = energyLayerGroup.title;
        
        // 레이어가 이미 열려있는 경우 부드러운 전환
        if (layer && layer.getAttribute('aria-hidden') === 'false') {
          // 새 레이어 컨텐츠를 먼저 로드
          openLayerById(clickedLayerId, clickedLayerTitle, true);
        } else {
          // 레이어가 닫혀있는 경우 일반적으로 열기
          openLayerById(clickedLayerId, clickedLayerTitle);
        }
      });
    });
  } else if (layerTabsArea) {
    layerTabsArea.innerHTML = '';
  }

  // 템플릿 내용 복사해서 컨텐츠에 삽입
  layerContent.innerHTML = template.innerHTML;

  // 푸터 버튼 생성
  if (layerFooter) {
    const footerHtml = `
      <div class="layer-footer-grid">
        ${layerFooterButtons.map(btn => `
          <button type="button" class="layer-footer-btn" data-layer-id="${btn.layerId}" data-layer-title="${btn.layerTitle.replace(/"/g, '&quot;')}">
            <span class="layer-footer-btn-text">${btn.label}</span>
            <span class="layer-footer-btn-icon">
              <svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M4.5 9L7.5 6L4.5 3" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
              </svg>
            </span>
          </button>
        `).join('')}
      </div>
    `;
    layerFooter.innerHTML = footerHtml;
  }

  // 전환 모드가 아닌 경우에만 스크롤 위치 저장 및 레이어 표시
  if (!isTransition) {
    // 현재 스크롤 위치 저장
    savedScrollPosition = window.scrollY;

    // 레이어 컨테이너 위치 설정
    // 상단 40px 떨어진 위치에 표시 (뷰포트 기준)
    layerContainer.style.top = '40px';
    layerContainer.style.height = '';
    layerContainer.style.maxHeight = '';

    // body 스크롤 잠금
    document.body.classList.add('layer-open');
    document.body.style.top = `-${savedScrollPosition}px`;

    // 레이어 표시
    layer.setAttribute('aria-hidden', 'false');
  } else {
    // 전환 모드: 컨텐츠만 교체하고 스크롤 위치 초기화
    layerContent.scrollTop = 0;
  }
}

// 레이어 열기 함수 (기존 방식 - title, content 직접 전달)
function openLayer(title, content) {
  if (!layer || !layerTitleArea || !layerContent || !layerContainer) return;

  // 타이틀 설정
  layerTitleArea.innerHTML = title;

  // h2 요소에 heading 클래스 추가
  const h2Element = layerTitleArea.querySelector('h2');
  if (h2Element) {
    h2Element.classList.add('heading');
  }

  // 컨텐츠 설정
  layerContent.innerHTML = content;

  // 푸터 버튼 생성
  if (layerFooter) {
    const footerHtml = `
      <div class="layer-footer-grid">
        ${layerFooterButtons.map(btn => `
          <button type="button" class="layer-footer-btn" data-layer-id="${btn.layerId}" data-layer-title="${btn.layerTitle.replace(/"/g, '&quot;')}">
            <span class="layer-footer-btn-text">${btn.label}</span>
            <span class="layer-footer-btn-icon">
              <svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M4.5 9L7.5 6L4.5 3" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
              </svg>
            </span>
          </button>
        `).join('')}
      </div>
    `;
    layerFooter.innerHTML = footerHtml;
  }

  // 현재 스크롤 위치 저장
  savedScrollPosition = window.scrollY;

  // 레이어 컨테이너 위치 설정
  // 상단 40px 떨어진 위치에 표시 (뷰포트 기준)
  layerContainer.style.top = '40px';
  layerContainer.style.height = '';
  layerContainer.style.maxHeight = '';

  // body 스크롤 잠금
  document.body.classList.add('layer-open');
  document.body.style.top = `-${savedScrollPosition}px`;

  // 레이어 표시
  layer.setAttribute('aria-hidden', 'false');
}

// 레이어 닫기 함수
function closeLayer() {
  if (!layer || !layerContainer) return;

  // 레이어 숨김
  layer.setAttribute('aria-hidden', 'true');

  // 레이어 컨테이너 위치 초기화
  layerContainer.style.top = '';
  layerContainer.style.height = '';

  // body 스크롤 잠금 해제
  document.body.classList.remove('layer-open');
  document.body.style.top = '';

  // 저장된 스크롤 위치로 복원
  window.scrollTo(0, savedScrollPosition);
  savedScrollPosition = 0;
}

// 닫기 버튼 클릭 이벤트
if (layerCloseBtn) {
  layerCloseBtn.addEventListener('click', closeLayer);
}

// 딤드 클릭 이벤트
if (layerDimmed) {
  layerDimmed.addEventListener('click', closeLayer);
}

// ESC 키로 닫기
document.addEventListener('keydown', (e) => {
  if (e.key === 'Escape' && layer && layer.getAttribute('aria-hidden') === 'false') {
    closeLayer();
  }
});

// 레이어 컨텐츠 영역 클릭 시 이벤트 전파 방지 (딤드 클릭과 구분)
if (layer) {
  const layerContainer = layer.querySelector('.layer-container');
  if (layerContainer) {
    layerContainer.addEventListener('click', (e) => {
      e.stopPropagation();
    });
  }
}

// 레이어 링크 클릭 이벤트 (data-layer-id 속성이 있는 링크에 자동 연결)
document.addEventListener('click', (e) => {
  const layerLink = e.target.closest('[data-layer-id]');
  if (layerLink && !layerLink.classList.contains('layer-tab-btn') && !layerLink.classList.contains('layer-footer-btn')) {
    e.preventDefault();
    const layerId = layerLink.getAttribute('data-layer-id');
    const layerTitle = layerLink.getAttribute('data-layer-title') || '';
    openLayerById(layerId, layerTitle);
  }
});

// 레이어 푸터 버튼 클릭 이벤트
if (layer) {
  layer.addEventListener('click', (e) => {
    const footerBtn = e.target.closest('.layer-footer-btn');
    if (footerBtn) {
      e.preventDefault();
      const layerId = footerBtn.getAttribute('data-layer-id');
      const layerTitle = footerBtn.getAttribute('data-layer-title') || '';
      openLayerById(layerId, layerTitle);
    }
  });
}

// 레이어 탭 클릭 이벤트 (레이어 내부 탭 네비게이션) - 이벤트 위임으로 처리
if (layer) {
  layer.addEventListener('click', (e) => {
    const tabBtn = e.target.closest('.layer-tab-btn');
    if (tabBtn) {
      e.preventDefault();
      e.stopPropagation();
      const layerId = tabBtn.getAttribute('data-layer-id');
      const layerTitle = energyLayerGroup.title;
      
      // 레이어가 이미 열려있는 경우 부드러운 전환
      if (layer.getAttribute('aria-hidden') === 'false') {
        openLayerById(layerId, layerTitle, true);
      } else {
        openLayerById(layerId, layerTitle);
      }
    }
  });
}

// 전역 함수로 export (다른 곳에서 호출 가능하도록)
window.openLayer = openLayer;
window.openLayerById = openLayerById;
window.closeLayer = closeLayer;
