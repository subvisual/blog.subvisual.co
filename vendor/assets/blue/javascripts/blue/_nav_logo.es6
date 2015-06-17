$(function(){
  window.subvisual = window.subvisual || {};
  window.subvisual.nav = window.subvisual.nav || {};
  window.subvisual.nav.logo = (function() {
    function showMonoLogo($element) {
      $element.find('.NavLogo').addClass('NavLogo--mono');
    }

    function showColoredLogo($element) {
      $element.find('.NavLogo').removeClass('NavLogo--mono');
    }

    function update($element) {
      if ($element.hasClass('Nav--light') || $element.hasClass('Nav--transparent')) {
        if ($element.hasClass('Nav--fixed')) {
          showColoredLogo($element);
        } else {
          showMonoLogo($element);
        }
      } else {
        showColoredLogo($element);
      }
    }

    function updateWithScroll(scrollState, $element) {
      if (scrollState.hasPassedTheElement($element.outerHeight())) {
        showColoredLogo($element);
      } else {
        update($element);
      }
    }

    return { update, updateWithScroll };
  })();
});
