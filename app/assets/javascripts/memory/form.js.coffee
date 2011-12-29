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
      $(".time_key_field").datepicker {
        # defaultDate: $(this).val() - fix format!!
        constrainInput: false
      }
      
      # Ensure new fields get date picker
      $("#add_time_frame").live "click", -> # now & in the future
        $(".time_frame_field").datepicker {
          constrainInput: false
        }
        $(".time_key_field").datepicker {
          constrainInput: false
        }
    
    # Time icon attributes
    setTimeIcon: ->
      # Clicking the time icon shows the time frames area and hides itself
      $("#time_icon").click ->
        $("#time_frames_area").fadeToggle()
        $(this).fadeToggle()
      
      # Clicking within the time frames area undoes the toggle
      $("#time_frames_area").click ->
        $("#time_icon").fadeToggle()
        $(this).fadeToggle()
      
      # This prevents child elements of time_frames_area from triggering the toggle
      $("#time_frames_area a , #time_frames_area input").click ->
        # $(this).stopPropagation() HERE
      
      # Clicking the small time icon hides the time frame forms
      # $("#small_time_icon").click ->
      #   $("#time_frames_area").fadeToggle()
      #   $(this).fadeToggle()
      #   $("#time_icon").fadeToggle()
      # 
      # # Prepare small time icon, which allows the user to hide the time frame forms
      # $("#small_time_icon").button {
      #   icons: { primary: 'ui-icon-clock'},
      #   # text: false
      # }
      # button({ icons: {primary:'ui-icon-gear',secondary:'ui-icon-triangle-1-s'} });