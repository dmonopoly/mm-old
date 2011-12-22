class TimeFrame < ActiveRecord::Base
  has_many :memory_time_frames
  has_many :memories, :through => :memory_time_frames
  has_many :time_keys  
  
  # accepts_nested_attributes_for :memories - needed if you have a form mainly for time_frames but with nested memories
  
  # default_scope :order => 'representation ASC' # change later to order by length, smallest to largest
  
  # default_scope :order => "length ASC"
  
  # Sorts by increasing length
  # Can use TimeFrame.all.sort
  def <=> other
    self.length <=> other.length
  end
  
  # Returns the length in seconds of the time frame
  # Can use TimeFrame.all.sort_by(&:length) in views
  # time_keys.count should be 0, 1, or 2
  def length
    if time_keys.count > 0
      if time_keys.count == 1
        86400 # number of seconds in a day
      elsif time_keys.count == 2
        difference(time_keys.first.date,time_keys.second.date)
      else
        throw "Oh hello there. Something happened. Remain calm... (length)"
        0
      end
    elsif time_keys.count == 0
      0
    else
      -1
    end
  end
  
  # NOTE: REDO THIS AREA LATER. LENGTHS AND OFFSETS NEED TO BE DONE IN JAVASCRIPT
  # SO YOU CAN CALCULATE BASED ON BROWSER HEIGHT FOR MAXIMUM PRECISION
    # NUMBER_OF_SECONDS_IN_A_LIFETIME = 2325000000 # 31,000,000 seconds per year * 75 years of life
    # NUMBER_OF_SECONDS_IN_A_DAY = 86400
    # 
    # # Returns the number of pixels in the big picture of life for this time frame's timeline
    # def big_picture_length
    #   if time_keys.count == 1
    #     0 # negligibly small for a one-day event
    #   else
    #     (length*3).to_i
    #   end
    # end
    # 
    # # Returns a relative vertical offset (margin-top); used to set up all other vertical offsets
    # def offset
    #   difference(Date.today, latest_date)/NUMBER_OF_SECONDS_IN_A_LIFETIME
    # end
    # 
    # # Returns the number of pixels in the big picture of life for this time frame's vertical offset
    # # from the top (margin-top)
    # def big_picture_offset
    #   unless big_picture_length == 0 # don't calculate if this length is zero
    #     (offset*3).to_i
    #   else
    #     0
    #   end
    # end
    # 
    private
      # absolute value of difference between 2 dates in +seconds+
      def difference date1, date2
        (date1.to_datetime() - date2.to_datetime()).abs
      end
    
      # Returns the latest date of this time frame based on the time frame's time keys
      def latest_date
        if time_keys.count == 1
          return time_keys.first.date
        elsif time_keys.count == 2
          date1 = time_keys.first.date
          date2 = time_keys.second.date
          puts '------------------'
          puts "nil? #{date1.before?(date2) ? date1 : date2}"
          puts '------------------'
          return date1.before?(date2) ? date1 : date2
        else
          Date.today
        end
      end
end
