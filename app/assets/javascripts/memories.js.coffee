# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  ## Alters ghost content area of form appropriately
  
  # Initialize ghost area with content already in textarea
  text = $('textarea#content_text_area').val()
  $("#ghost_content_area").html(text)
  
  proper_color = $("#ghost_content_area").css('color') # store original color of ghost text
  
  # On keyup, update the appearance accordingly
  $("#content_text_area").keyup ->
    text = $('textarea#content_text_area').val() # store text of textarea
    $("#ghost_content_area").html(text)
    if text.length > 140
      $("#ghost_content_area").css('color','red') # change color of ghost content
      $("#submit_memory_button").attr('disabled','disabled') # disable submit button
    else
      $("#ghost_content_area").css('color', proper_color)
      $("#submit_memory_button").removeAttr('disabled')
    
    # Character indicator appears if user has <= 10 characters left
    if text.length > 129
      # $("#character_indicator").css('visibility','visible')
      # $("#character_indicator").css('display','block')
      $("#character_indicator").html(140-text.length)
    else
      # $("#character_indicator").css('visibility','hidden')
      # $("#character_indicator").css('display','none')
      $("#character_indicator").html('&nbsp;')
    
	# Triggers for superadmin users list:
	# Superadmin
  # $("#manager_list_trigger").click ->
    # $("#superadmins_list").toggle()
	