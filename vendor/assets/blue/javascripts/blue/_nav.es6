$(function() {
  window.subvisual = window.subvisual || {};
  window.subvisual.nav = window.subvisual.nav || {};
  window.subvisual.nav.bar = (function() {
    let $element = $('.Nav');
    let navLogo = window.subvisual.nav.logo;
    let navVisibility = window.subvisual.nav.visibility;

    function update(currentScrollTop, lastScrollTop) {
      let scrollState = new ScrollState(currentScrollTop, lastScrollTop);

      navVisibility.update(scrollState, $element);
      navLogo.updateWithScroll(scrollState, $element);
    }

    navLogo.update($element);
    navVisibility.updateAfterAnimation($element);

    return { update };
  })();
});
