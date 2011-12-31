# Helper / personalized functions
jQuery ->

# Example:
# $.fn.myFunction = -> # So you can do $("#something").myFunction
#   $(this).addClass "changed"

# Toggles the visibility element rather than display
# Uses fadeToggle() effect
$.fn.fadeToggleV = ->
  if $(this).css('visibility') == 'visible'
    alert "hey"
    $(this).animate
      visibility: "hidden"
      border: "1px solid blue"
    , 1000 # duration
  else
    $(this).animate
      visibility: 'visible'
    , 1000

    # animate() example:
    # $("#book").animate
    #   opacity: 0.25
    #   left: "+=50"
    #   height: "toggle"
    # , 5000, ->