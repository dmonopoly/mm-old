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
      # Clicking the time icon toggles the time frames area
      $("#time_icon").click ->
        $("#time_frames_form").fadeToggle()
    
    # Location icon attributes
    setLocationIcon: ->
      # Clicking the location icon toggles the location field
      $("#location_icon").click ->
        $("#location_field").fadeToggle()
    
    # Set the format of time keys to be right (override edit's default time key date formats)
    setTimeFramesFormat: ->
      $(".time_key_field").each ->
        value = $(this).attr('value')
        unless value == ''
          # Date conversion
          dateparts = value.split('-')
          value2 = dateparts[1]+"/"+dateparts[2]+"/"+dateparts[0]
          $(this).attr('value', value2)
    
    # Fancy token setup
    setLocationTokens: ->
      $("#location_token_field").tokenInput "/person/locations.json", {
        crossDomain: false,
        prePopulate: $(this).data("pre"),
        theme: "facebook",
        preventDuplicates: true
      }
      # tokenInput creates this textfield - the one actually visible
      $("#token-input-location_token_field").addClass("shorter_text_field elegant_text_field")