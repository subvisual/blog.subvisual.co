$(function() {
  var body = $('body');
  var nav = $('.Nav');
  var navOverlay = $('.NavOverlay');
  var burger = nav.find('.Burger');

  function closeOverlay() {
    body.css('overflow', 'auto'); 

    burger.removeClass('is-open');
    nav.removeClass('is-open');
    navOverlay.removeClass('is-open');
  }

  function openOverlay() {
    body.css('overflow', 'hidden'); 

    burger.addClass('is-open');
    nav.addClass('is-open');
    navOverlay.addClass('is-open');
  }

  closeOverlay();
  var open = false;

  nav.on('click', '.Nav-menu', function() {
    if (!open) {
      openOverlay();
      open = true;
    } else {
      closeOverlay();
      open = false;
    }
  });
});
