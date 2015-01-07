$('#js-menu-toggle').on 'click', ->
  $('#nav').slideToggle()


$(document).on 'click', '.hire-us a', ->
  if(ga)
    label = $(this).parent().siblings('.post-icon').find('a').attr('href')
    ga('send', 'event', 'hireUs', 'click', label)
