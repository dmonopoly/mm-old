# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  # Alters ghost content area of form appropriately
  $("#content_text_area").keyup ->
    text = $('textarea#content_text_area').val();
    $("#ghost_content_area").html(text)
    
	# Triggers for superadmin users list:
	# Superadmin
  # $("#manager_list_trigger").click ->
    # $("#superadmins_list").toggle()
	