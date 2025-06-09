gsap.registerPlugin(ScrollTrigger);

function parallax() {
  const parallaxContainer = document.querySelector('.parallax-container');
  const parallaxItems = gsap.utils.toArray('.parallax-item');
  const parallaxTxt = document.querySelector('.parallax-txt-bx');

  const parallax = gsap.timeline({
    scrollTrigger:{
      trigger: parallaxContainer,
      start: '6%',
      end: '10%',
      scrub: true,
    }
  });

  parallax
  .to(parallaxTxt, {y: "20%"})
  .to(parallaxItems[0], {y: "-8%"})
  .to(parallaxItems[1], {y: "-24%", x: "-2%"})
  .to(parallaxItems[2], {y: "-10%"});
}

parallax();