$(function(){
  window.subvisual = window.subvisual || {};
  window.subvisual.nav = window.subvisual.nav || {};
  window.subvisual.nav.logo = (function() {
    function showMonoLogo($element) {
      $element.find('.Nav-logo[data-mono]').removeClass('is-hidden');
      $element.find('.Nav-logo:not([data-mono])').addClass('is-hidden');
    }

    function showColoredLogo($element) {
      $element.find('.Nav-logo[data-mono]').addClass('is-hidden');
      $element.find('.Nav-logo:not([data-mono])').removeClass('is-hidden');
    }

    function update($element) {
      if ($element.hasClass('Nav--light') || $element.hasClass('Nav--activeWithBackground')) {
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
