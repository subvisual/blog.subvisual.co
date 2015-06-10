$(function() {
  'use strict';

  new Vue({
    el: '#Editor',
    filters: {
      marked: marked
    }
  });

  $('#Editor-textarea').inlineattachment({
    uploadUrl: '<%= Rails.application.routes.url_helpers.admin_images_path %>'
  });
});
