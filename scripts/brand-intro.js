// Play once only when the visitor has not requested reduced motion.
const brandIntro = document.querySelector('#brand-intro');
const reducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)');
function updateBrandMotion() {
  if (reducedMotion.matches) {
    brandIntro.pause();
    brandIntro.currentTime = 0;
  } else if (!brandIntro.ended) {
    brandIntro.play().catch(() => {
      // Keep the poster and description if the browser blocks autoplay.
    });
  }
}
reducedMotion.addEventListener('change', updateBrandMotion);
updateBrandMotion();
