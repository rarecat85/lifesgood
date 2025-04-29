const emptyImg = document.querySelectorAll('.ST0027 .c-summary-picture .cmp-image__image');

emptyImg.forEach(img => {
  // 이미지 소스에 ai-gate-image-product-category-product-feature-block 문자열이 포함되어 있는지 확인
  if (img.src.includes('ai-gate-image-product-category-product-feature-block')) {
    // 상위 요소 중 swiper-slide 클래스를 가진 요소 찾기
    const swiperSlide = img.closest('.swiper-slide');
    // 해당 요소가 존재하면 삭제
    if (swiperSlide) {
      swiperSlide.remove();
    }
  }
});