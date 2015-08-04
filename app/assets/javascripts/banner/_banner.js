$(function(){
  window.subvisual = window.subvisual || {};
  window.subvisual.banner = (function() {
    var $element = $('.Banner');

    function putBellowNav() {
      if ($element.hasClass('Banner--bellowNav')) return;

      $element.removeClass('Banner--show');
      $element.removeClass('Banner--animateTop');

      $element.addClass('Banner--bellowNav');
    }

    function putOnTop() {
      console.log('onTop');
      if ($element.hasClass('Banner--animateTop')) return;

      if ($element.hasClass('Banner--bellowNav')) {
        $element.removeClass('Banner--bellowNav');
        $element.addClass('Banner--animateTop');
      } else {
        ($element.addClass('Banner--show'));
      }
    }

    function removeBanner() {
      console.log('remove');

      $element.removeClass('Banner--show');
      $element.removeClass('Banner--bellowNav');
      $element.removeClass('Banner--animateTop');
    }

    function updateWithScroll(scrollState, $element) {
      if (scrollState.hasntScrolledEnough())
        return;

      if (scrollState.isAtTheTop()) {
        removeBanner();
        return;
      }

      var hasPassedTheElement = scrollState.hasPassedTheElement($element.outerHeight());

      if (scrollState.hasScrolledDown()) {
        putOnTop();
      } else {
        putBellowNav();
      }
    }

    return { updateWithScroll };
  })();
});
