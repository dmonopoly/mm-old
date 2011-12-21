# Implementation of Application.Memory.Index class
jQuery ->

@module "Application.Memory", ->
  class @Index
    # Needed because the height depends on window size
    setHeightOfLifeTimeFrame: ->
      height = `$(document).height()`
      $('#life_time_frame').css('height', height-50 + 'px');
    
    # On keyup, update the appearance accordingly for starting text
    setTimeFrameToggleOnHover: ->
      try
        # Set toggle of time frames upon memory hover
        $(".memory").hover ->
          that = $(this)
          # that.css('border', '1px solid red')
        
          # Toggle life time frame, which must be done every time
          $("#life_time_frame").stop(true, true).fadeToggle()
          
          # Get id of e.g. memory_3
          memory = that.attr('id')
          id = memory.split('_')[1]
          
          # stop = false
          
          # Cycle through all keys
          $(".keys").each ->
            # alert "id of timeline: " + $(this).parent().attr('id')
            
            # Get string of memory ids, like [1, 4, 5]
            keys = $(this).html()
            
            # alert "raw keys|"+keys+"|"
          
            keys = keys[1..-2] # 1, 4, 5
          
            # alert "keys after bracket removal|"+keys+"|"
          
            memory_ids = keys.split(', ')
            memory_ids = memory_ids
          
            # unless stop
              # alert "memory_ids|"+memory_ids+"|"
            # stop = true
          
            # Toggle timelines if the timeline contains the memory id for the memory that is hovered over
            for m_id in memory_ids
              if m_id == id
                $(this).parent().stop(true, true).fadeToggle()
      catch error
        # catch the error
      finally
        # wrap up