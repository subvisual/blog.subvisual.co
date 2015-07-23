$(function() {
  var body = $('body');
  var nav = $('.Nav');
  var navOverlay = $('.NavOverlay');
  var menu = $('.Nav-menu');
  var burger = nav.find('.Burger');
  var navOverlayFirstItem = $('.NavOverlay .NavOverlay-item:first .NavOverlay-link');

  closeOverlay();
  bindFocusEvents();

  var open = false;

  nav.on('click', '.Nav-menu', function() {
    if (!open) {
      openOverlay();
    } else {
      closeOverlay();
    }
    window.subvisual.nav.logo.update(nav);
  });

  // remove from accesibility tree when hidden.
  navOverlay.on('transitionend', function() {
    if (!open)
      navOverlay.css('display', 'none');
  });

  function closeOverlay() {
    open = false;
    body.css('overflow', 'auto');

    burger.removeClass('is-open');
    nav.removeClass('is-open');
    navOverlay.removeClass('is-open');
  }

  function openOverlay() {
    open = true;
    body.css('overflow', 'hidden');

    burger.addClass('is-open');
    nav.addClass('is-open');
    navOverlay.css('display', 'block');
    navOverlay.addClass('is-open');
  }

  function bindFocusEvents() {
    navOverlayFirstItem.on('keydown', function(e) {
      if (e.which == 9 && e.shiftKey) { // 9 is the keyCode for TAB
        menu.focus();
        e.preventDefault();
      }
    });

    menu.on('keydown', function(e) {
      if (open && e.which == 9 && !e.shiftKey) { // 9 is the keyCode for TAB
        navOverlayFirstItem.focus();
        e.preventDefault();
      }
    });

    $('body').on('keydown', function(e) {
      if (open && e.which == 27) // 27 is the keyCode for ESC
        closeOverlay();
    });
  }
});
