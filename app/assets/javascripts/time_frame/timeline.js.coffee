# Implementation of Application.Timeline class
# not used...
jQuery ->

@module "Application.TimeFrame", ->
  class @Timeline
    # time_frame
    
    # Draw / create this timeline! (which is really a div)
    draw: -> # NOT USED
      try
        x = "#timelines_index"
        styles = "min-height:500px; border: 1px solid red;"
        timeline = '<div style=' + styles + '></div>'
        $(timeline).css('background','blue')
        $(timeline).appendTo(x)
        
        # $("#timelines_index").css(someparam)
      catch error
        alert "not found"
        # print error
      finally
        # cleanUp()