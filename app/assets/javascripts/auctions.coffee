# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $('.usernew').hide()
  $('.userlogin').hide()
  $('.auction-form').hide()
  $('.bid-form').hide()
  
  $('.signup').click ->
    $('.usernew').toggle()
  
  $('.login').click ->
    $('.userlogin').toggle()
    
  $('.auction').click ->
    $('.auction-form').toggle()
    
  $('.bid').click ->
    $('.bid-form').toggle()
    
  $('.alert').fadeOut(4000, -> $(this).remove())
    