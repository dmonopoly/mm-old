# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  # Class: FORM
  # Alters ghost content area of form appropriately
  form = new Application.Memory.Form
  form.prepareGhostArea() # note: currently, this is attempted all the time...
  form.setDatePicker()
  form.setTimeIcon()
  form.setLocationIcon()
  form.setTimeFramesFormat()
  
  form.updateGhostAreaOnKeyUp()
  
  # Class: INDEX
  index = new Application.Memory.Index
  index.setTimeFrameAppearance()
  index.setTimeFrameToggleOnHover()
  index.setMemoryHoverAction() # not used