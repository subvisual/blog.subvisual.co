$(function(){
  window.subvisual = window.subvisual || {};
  window.subvisual.banner = (function() {
    var $banner = $('.Banner');

    function clearState($element) {
      $element.removeClass('Banner--hide');
      $element.removeClass('Banner--show');
      $element.removeClass('Banner--bellowNav');
      $element.removeClass('Banner--animateTop');
    }

    function putBellowNav($element) {
      if ($element.hasClass('Banner--bellowNav')) return;

      clearState($element);
      $element.addClass('Banner--bellowNav');
    }

    function putOnTop($element) {
      if ($element.hasClass('Banner--animateTop')) return;

      if ($element.hasClass('Banner--bellowNav')) {
        clearState($element);
        $element.addClass('Banner--animateTop');
      } else {
        clearState($element);
        $element.addClass('Banner--show');
      }
    }

    function hide($element) {
      if ($element.hasClass('Banner--hide')) return;

      if (!$element.is('.Banner--show, .Banner--animateTop, .Banner--bellowNav')) return;

      clearState($element);
      $element.addClass('Banner--hide');
    }

    function updateWithScroll(scrollState) {
      var hasPassedTheElement = scrollState.hasPassedTheElement($banner.outerHeight());

      if (!hasPassedTheElement) {
        hide($banner);
        return;
      }

      if (scrollState.hasntScrolledEnough())
        return;

      if (scrollState.hasScrolledDown()) {
        putOnTop($banner);
      } else {
        putBellowNav($banner);
      }
    }

    return { updateWithScroll };
  })();
});
