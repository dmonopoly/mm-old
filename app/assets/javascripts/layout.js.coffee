# Layout file for the other coffeescript files.
# Defines general structure of modules and classes, and prepares basic layout JS.
jQuery ->

# WHY DOESN'T THIS WORK???
$("#flash").delay(2000).fadeToggle() # number of milliseconds

@module "Application", ->
    
  @module "Memory", ->
    class @Form # so you can do formHelper = new Application.Memory.Form
      info: "prepareGhostArea(), updateGhostAreaOnKeyUp(), setDatePicker()"
  
    class @Index
      info: "setTimeFrameAppearance(), setTimeFrameToggleOnHover(), setMemoryHoverAction()"
