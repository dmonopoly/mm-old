# Layout file for the other coffeescript files.
# Defines general structure of modules and classes.

@module "Application", ->
  @module "Memory", ->
    class @Form # so you can do formHelper = new Application.Memory.Form
      info: "prepareGhostArea(), updateGhostAreaOnKeyUp(), setDatePicker(), setTimeIcon(), setLocationIcon()
              setTimeFramesFormat(), setLocationTokens()"
  
    class @Index
      info: "setTimeFrameAppearance(), setTimeFrameToggleOnHover(), setMemoryHoverAction(),
              setTimeFramesOnClick(), setTimeFramesOnHover()"

  @module "Misc", ->
    class @Flash
      info: "setFlashToggle()"