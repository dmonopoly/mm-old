# Implementation of Application.Memory.Index class
jQuery ->

@module "Application.Memory", ->
  class @Index
    # Set heights and vertical offsets (margin top) of time frames
    setTimeFrameAppearance: ->
      life_height = $(window).height()-64 # useful constant; depends on document's height
      # Time lines div in general
      $("#timelines").css('height', life_height + 'px')
      
      # Time frame words
      $("#time_frame_words").css('display','none')
      
      # Life time frame
      $('#life_time_frame').css('height', life_height + 'px');
      
      # Useful variables
      days_lived = 6574 # number of days in ~18 years of life - change later to use birth date!!!
                        # or perhaps do something else to make the timeline provide PERSPECTIVE..
                        # like by estimating how long you'll live... a bit scary...
      life_factor = life_height/days_lived # useful factor for calculation; px per day
      
      # Other time frames
      $(".timeline").each ->
        time_length = $(this).attr('id').split('_')[3] # get time lengths in days of time frames
        days_ago = $(this).attr('id').split('_')[4] # get the time length of days ago (to time key nearest now)
        
        if time_length == "1" # if the time frame is one date
          offset = life_factor * days_ago # px per day * days = px
          $(this).css('margin-top', offset)
          # Bright spark for single-day memories!
          $(this).css('height', '2px') # spark size, haha
          $(this).css('width', '2px')
          $(this).css('background', 'red')
        else
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
          # Toggle life time frame, which must be done every time
          $("#life_time_frame").stop(true, true).fadeToggle()
          
          # Get id of e.g. memory_3
          memory = $(this).attr('id')
          id = memory.split('_')[1]
          
          # Cycle through all keys
          $(".keys").each ->
            keys = $(this).html() # Get string of memory ids, like [1, 4, 5]
            unless keys.empty
              keys = keys[1..-2] # Get 1, 4, 5
              memory_ids = keys.split(', ') # Make array
          
              # Toggle timelines if the timeline contains the memory id for the memory that is hovered over
              for m_id in memory_ids
                if m_id == id
                  $(this).parent().stop(true, true).fadeToggle()
      catch error
        # catch the error
      finally
        # wrap up
        
    # Makes a memory block change nicely upon hover - not done
    setMemoryHoverAction: ->
      $(".memory").hover ->
        that = $(this)
        # that.stop(true, true).toggle ->
        #     that.css({borderLeft: "1px solid green"});
        # }, function() {
        #     that.css({borderLeft: "1px solid gray"});
        # });
    
    setTimeFramesOnClick: ->
      $("#timelines").click ->
        `window.location.href = '/person/time_frames';` # go to time_frames index
        
    setTimeFramesOnHover: ->
      $("#timelines").hover ->
        $("#time_frame_words").stop(true, true).fadeToggle()
        $("#life_time_frame").stop(true, true).fadeToggle()