# Needs refactoring for new time key concept
class TimeFrame < ActiveRecord::Base
  has_many :memory_time_frames
  has_many :memories, :through => :memory_time_frames
  
  # accepts_nested_attributes_for :memories - needed if you have a form mainly for time_frames but with nested memories
  
  # default_scope :order => 'representation ASC' # change later to order by length, smallest to largest
  
  # default_scope :order => "length ASC"
  
  # Sorts by increasing length
  # Can use TimeFrame.all.sort
  def <=> other
    self.length <=> other.length
  end
  
  # Returns the length in days of the time frame
  # Can use TimeFrame.all.sort_by(&:length) in views
  # time_keys.count should be 0, 1, or 2
  # 0 if no time keys
  def length
    if time_keys.count > 0
      if time_keys.count == 1
        1
      elsif time_keys.count == 2
        difference(time_keys.first, time_keys.second)
      else
        throw "Oh hello there. Something happened. Remain calm... (length)"
        0
      end
    elsif time_keys.count == 0
      0
    else
      throw "Uhhhhh. Whoops. I can't count, sorry. (length)"
      -1
    end
  end
  
  # Returns the number of days between the latest date of the time frame and today
  # 0 if no time keys
  def days_ago
    (Date.today.to_datetime - latest_date.to_datetime).to_i
  end
  
  private
    # Timespan from date1 to date2, in +days+ (datetime minus datetime returns a +day+ count)
    def difference date1, date2
      (date1.to_datetime - date2.to_datetime).abs.to_i
    end
  
    # Returns the latest date of this time frame based on the time frame's time keys
    def latest_date
      if time_keys.count == 1
        time_keys.first
      elsif time_keys.count == 2
        date1 = time_keys.first
        date2 = time_keys.second
        return date1 > date2 ? date1 : date2 # date1 > date2 => 'true' means date1 comes after date2
      else
        Date.today # arbitrary, but sensible for offset calculation in index.js.coffee
      end
    end
    
    # Returns the dates in an array: [first_date, second_date]
    # Does not put a date in the array if the date is nil.
    def time_keys
      arr = [ ]
      arr.push first_date unless first_date.nil?
      arr.push second_date unless second_date.nil?
      arr
    end
end
