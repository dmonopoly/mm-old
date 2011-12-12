# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  # FORM
  # Alters ghost content area of form appropriately
  formHelper = new Application.Memory.Form
  formHelper.prepareGhostArea() # note: currently, this is attempted all the time...
  formHelper.updateGhostAreaOnKeyUp();
  
  # Triggers for superadmin users list:
  # Superadmin
  # $("#manager_list_trigger").click ->
  #   $("#superadmins_list").toggle()
  # 