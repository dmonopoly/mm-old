# Helper / personalized functions
jQuery ->

# Example:
# $.fn.myFunction = -> # So you can do $("#something").myFunction
#   $(this).addClass "changed"

# NOT USED
# Toggles the visibility element rather than display
# Uses fadeToggle() effect
$.fn.fadeToggleV = ->
  if $(this).css('visibility') == 'visible'
    $(this).animate
      opacity: 0.25
      visibility: 'toggle'
    , 5000
    # $(this).css('visibility', 'hidden')
  else
    $(this).css('visibility', 'visible')

    # animate() example:
    # $("#book").animate
    #   opacity: 0.25
    #   left: "+=50"
    #   height: "toggle"
    # , 5000, ->