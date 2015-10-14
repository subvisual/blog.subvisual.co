$(function() {
  var isOverLogo = false;

  function logoAnimation() {
    $('.NavLogo-piece').each(function() {
      TweenLite.set(this, { fillOpacity: 0, strokeDasharray: this.getTotalLength(), strokeDashoffset: this.getTotalLength() });
      TweenLite.to(this, 0.5, { strokeDashoffset: 0 });
      TweenLite.to(this, 0.8, { fillOpacity: 1, delay: 0.5 });
    });

    $('.NavLogo-shadow').each(function() {
      TweenLite.fromTo(this, 0.5, { fillOpacity: 0 }, { fillOpacity: 1, delay: 0.8});
    });
  }

  function mouseOverAnimation() {
    if (isOverLogo) { return; }
    isOverLogo = true;
    logoAnimation();
  }

  function mouseLeave() {
    setTimeout(function() {
      isOverLogo = false;
    }, 1000);
  }

  $('.NavLogo').on('mouseenter', mouseOverAnimation);
  $('.NavLogo').on('mouseleave', mouseLeave);
});
