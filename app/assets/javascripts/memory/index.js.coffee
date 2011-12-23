# Implementation of Application.Memory.Index class
jQuery ->

@module "Application.Memory", ->
  class @Index
    # Set heights and vertical offsets (margin top) of time frames
    setTimeFrameAppearance: ->
      life_height = `$(document).height()`-50 # useful constant; depends on document's height
      
      # Life time frame
      $('#life_time_frame').css('height', life_height + 'px');
      
      # Other time frames
      $(".timeline").each ->
        days_lived = 6574 # number of days in ~18 years of life - change later to use user.rb
        life_factor = life_height/days_lived # useful factor for calculation; px per day
        
        time_length = $(this).attr('id').split('_')[3] # get time lengths in days of time frames
        days_ago = $(this).attr('id').split('_')[4] # get the time length of days ago (to time key nearest now)
        
        height = life_factor * time_length # px per day * days = px
        if height >= 1
          $(this).css('height', height)
          offset = life_factor * days_ago # px per day * days = px
          $(this).css('margin-top', offset)
        else
          $(this).css('height', 0) # too small to be seen; don't bother calculating offset
    
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
                $(this).parent().stop(true, true).fadeToggle('fast')
                
      catch error
        # catch the error
      finally
        # wrap up
        
    # Makes a memory block change nicely upon hover
    setMemoryHoverAction: ->
      $(".memory").hover ->
        that = $(this)
        # that.stop(true, true).toggle ->
        #     that.css({borderLeft: "1px solid green"});
        # }, function() {
        #     that.css({borderLeft: "1px solid gray"});
        # });