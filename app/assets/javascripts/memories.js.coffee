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
  
  # Set toggle of time frames
  # $(".memory").hover ->
  #   memory = $(this).attr('id')
  #   id = memory.split('_')[1] # get id of e.g. memory_4
  #   #find memory
  #     time_frames = <% Memory.find(id).time_frames %>
  #   for time_frame in time_frames
  #     tf_id = time_frame.id
  #     $("#"+tf_id).toggle()
  
  # $(this).fadeOut(100);$(this).fadeIn(500)
  
  # Triggers for superadmin users list:
  # Superadmin
  # $("#manager_list_trigger").click ->
  #   $("#superadmins_list").toggle()
  #