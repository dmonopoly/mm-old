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
      # Set toggle of time frames upon memory hover
      $(".memory").hover ->
        $(this).css('border', '1px solid red')

        _toggleLifeTimeFrame()
        id = _getMemoryId() # Get id of e.g. memory_3
        
        # Cycle through all .timeline
        $(".timeline").each ->
          memory_ids = _getMemoryIdsOfTimeFrame()
          
          # Toggle timelines if the timeline contains the memory id for the memory that is hovered over
          for m_id in memory_ids
            if m_id == id
              $(this).toggle('slow')
              # $(this).fadeIn(500)
              
    _toggleLifeTimeFrame: ->
      # $("#life_time_frame").fadeIn(500)
      $("#life_time_frame").toggle('slow')
      
    _getMemoryId: ->
      memory = $(this).attr('id')
      return memory.split('_')[1]
    
    # Memory ids of time frame
    _getMemoryIdsTimeFrame: ->
      # Get string of memory ids, like [1, 4, 5].. try $(this).children().html()
      keys = $(this).html()
      keys = keys[1..-2] # 1, 4, 5
      memory_ids = keys.split(', ')