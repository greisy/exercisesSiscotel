# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "ajax:success", "form#comments-form", (env, data) ->
  console.log data.body
  $(this).find("textarea").val("")
  $("#comments-box").append("<li> #{data.body} - #{data.user.email} </li>")