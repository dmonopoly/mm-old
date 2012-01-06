# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  # Class: FORM
  # Alters ghost content area of form appropriately
  form = new Application.Memory.Form
  form.prepareGhostArea() # note: currently, this is attempted all the time... how can I limit this to certain views?
  form.setDatePicker()
  form.setTimeIcon()
  form.setLocationIcon()
  form.setTimeFramesFormat()
  
  # form.updateTimeFrames() # In progress.
    # get rep string on key up; check value, update other fields
    # problem: how to reuse time frames! how can the app detect when a time frame already exists?
    # Could I use JS to make the time frame form fill out perfectly, and then uniq! in the controller?
    
    # Plan: Use clever JS. On key up in the tf rep, allow existing time frames to appear adjacently.
    # Users can click an existing time frame, and JS makes the tf rep field fill up with that value.
    # On click of an existing time frame (or when a JS check realizes the tf rep is equal to an existing
    # tf rep [just check on key up & store tf reps in hidden field]), update time key fields.
    # 
    # On form submission, in the controller, detect memory_time_frame ... perhaps with f.hidden field :blah_id...
    # ... and do something you're not sure about yet...
    # HOLD OFF. Try token input on locations!
  form.setLocationTokens()
  form.updateGhostAreaOnKeyUp()
  
  # Class: INDEX
  index = new Application.Memory.Index
  index.setTimeFrameAppearance()
  index.setTimeFrameToggleOnHover()
  index.setMemoryHoverAction() # not used
  index.setTimeFramesOnClick()
  index.setTimeFramesOnHover() # add fancy stuff later