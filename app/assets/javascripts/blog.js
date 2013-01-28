$(document).ready(function($) {
  $("#heart").click(function(){
    $("#main_nav").stop(true, true).slideToggle(500);
  });
});
