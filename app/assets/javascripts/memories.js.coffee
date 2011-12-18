# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  # Class: FORM
  # Alters ghost content area of form appropriately
  form = new Application.Memory.Form
  form.prepareGhostArea() # note: currently, this is attempted all the time...
  form.updateGhostAreaOnKeyUp()
    
  # Set height of "life" time frame on memories index
  height = `$(document).height()`
  $('#life_time_frame').css('height', height-50 + 'px');