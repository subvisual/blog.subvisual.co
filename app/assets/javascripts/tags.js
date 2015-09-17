$(function() {
  $search = $('#Search');
  $tags   = $('#Search-tagsWrapper');

  $search.bind({
    focusin: function() {
      if ($search.hasClass('is-focused')) {
        return;
      }

      $tags
        .velocity('slideDown', { easing: 'ease-out' })
        .velocity('fadeIn', { queue: false, duration: 1000 });
      $search.addClass('is-focused');
    },

    focusout: function() {
      setTimeout(function() {
        if (!$search.hasClass('is-focused') ||
            $search.find(':focus').length > 0) {
          return;
        }

        $search.removeClass('is-focused');
        $tags
          .velocity('slideUp', { easing: 'ease-out' })
          .velocity('fadeOut', { queue: false });
      }, 0);
    }
  });

  $search.on('mousedown', '.Search-clear', function() { return false; })
});
