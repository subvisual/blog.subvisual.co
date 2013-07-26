$(document).foundation()

$('#heart').on 'click', '.js-menu-toggle', ->
  $('#main-nav-row').slideToggle()
