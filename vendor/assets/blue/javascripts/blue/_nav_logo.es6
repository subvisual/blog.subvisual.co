$(function(){
  window.subvisual = window.subvisual || {};
  window.subvisual.nav = window.subvisual.nav || {};
  window.subvisual.nav.logo = (function() {

    function showMonoLogo($element) {
      $element.removeClass('NavLogo--color').addClass('NavLogo--mono');
    }

    function showColoredLogo($element, $navLogo) {
      $element.removeClass('NavLogo--mono').addClass('NavLogo--color');
    }

    function backgroundIsLight($el) {
      var
        isOpen = $el.hasClass('is-open'),
        isFixed = $el.hasClass('Nav--fixed'),
        isTransparent = $el.hasClass('Nav--light') || $el.hasClass('Nav--transparent');

      return isOpen || (isTransparent && isFixed) || (!isTransparent);
    }

    function update($element) {
      var $navLogo = $element.find('.NavLogo');

      if (backgroundIsLight($element)) {
        showColoredLogo($navLogo);
      } else {
        showMonoLogo($navLogo);
      }
    }

    function updateWithScroll(scrollState, $element) {
      var $navLogo = $element.find('.NavLogo');

      if (scrollState.hasPassedTheElement($element.outerHeight())) {
        showColoredLogo($navLogo);
      } else {
        update($element);
      }
    }

    return { update, updateWithScroll };
  })();
});
