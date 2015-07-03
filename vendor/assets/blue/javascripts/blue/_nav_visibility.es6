$(function(){
  window.subvisual = window.subvisual || {};
  window.subvisual.nav = window.subvisual.nav || {};
  window.subvisual.nav.visibility = (function() {
    function updateAfterAnimation($element) {
      if (!$element[0]) {
        return;
      }

      $element[0].addEventListener("animationend", function(e) {
        if (e.animationName == 'slideup') {
          $element.addClass('Nav--hint');
          $element.removeClass('Nav--fixed');
          $element.removeClass('Nav--animateUp');
          $element.find('.Burger').removeClass('Burger--fixed');
        }
      }, false);
    }

    function unaffixNav(isAtTheTop, $element) {
      if (isAtTheTop) {
        $element.removeClass('Nav--fixed');
        $element.removeClass('Nav--hint');
        $element.find('.Burger').removeClass('Burger--fixed');
      }
    }

    function hideNav(hasPassedTheElement, $element) {
      if ($element.hasClass('Nav--fixed')) {
        $element.addClass('Nav--animateUp');
      } else if (hasPassedTheElement) {
        $element.addClass('Nav--hint');
      }
    }

    function affixNav(hasPassedTheElement, $element) {
      if ((!hasPassedTheElement && $element.hasClass('Nav--fixed')) || hasPassedTheElement) {
        $element.addClass('Nav--fixed');
        $element.removeClass('Nav--hint');
        $element.find('.Burger').addClass('Burger--fixed');
      } else if (!hasPassedTheElement) {
        $element.removeClass('Nav--hint');
      }
    }

    function update(scrollState, $element) {
      unaffixNav(scrollState.isAtTheTop(), $element);

      if (scrollState.hasntScrolledEnough())
        return;

      let hasPassedTheElement = scrollState.hasPassedTheElement($element.outerHeight());

      if (scrollState.hasScrolledDown()) {
        hideNav(hasPassedTheElement, $element);
      } else {
        affixNav(hasPassedTheElement, $element);
      }
    }

    return { update, updateAfterAnimation };
  })();
});
