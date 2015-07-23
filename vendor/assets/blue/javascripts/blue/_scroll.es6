$(function() {
  let didScroll;
  let lastScrollTop = 0;
  let currentScrollTop;

  function checkScroll() {
    didScroll = true;
  }

  setInterval(function() {
    if (didScroll) {
      currentScrollTop = $(document).scrollTop();
      window.subvisual.nav.bar.update(currentScrollTop, lastScrollTop);
      lastScrollTop = currentScrollTop;

      didScroll = false;
    }
  }, 250);

  window.onscroll = checkScroll;
  setTimeout(checkScroll, 50);
});
