# Implementation of Application.Memory.Form class
jQuery ->

@module "Application.Memory", ->
  class @Form
    # Initialize ghost area with content already in textarea
    prepareGhostArea: ->
      try
        text = $('textarea#content_text_area').val()
        text = text[0..99] # first 100 characters
        $("#ghost_content_area").html(text)
      catch error
        # print error
      finally
        # cleanUp()
    
    # On keyup, update the appearance accordingly for starting text
    updateGhostAreaOnKeyUp: ->
      $("#content_text_area").keyup ->
        text = $('textarea#content_text_area').val() # store text of textarea
        text = text[0..99]
        $("#ghost_content_area").html(text)
        # $("#character_indicator").html(text.length)
    
    # Prepares jQuery's datepicker widget for time frame fields  
    setDatePicker: ->
      # First time
      $(".time_frame_field").datepicker {
          constrainInput: false
        }
      $(".time_key_field").datepicker()
      
      # Ensure new fields get date picker
      $("#add_time_frame").live "click", -> # now & in the future
        $(".time_frame_field").datepicker {
            constrainInput: false
          }
        $(".time_key_field").datepicker()