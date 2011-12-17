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
  
  # Returns a relative length for the time frame; used to set up all other lengths
  # Can use TimeFrame.all.sort_by(&:length) in views
  def length
    if time_keys.count == 1
      25 # length of a single day memory, negligibly small
    elsif time_keys.count == 2
      number_of_seconds_in_a_lifetime = 2325000000 # 31,000,000 seconds per year * 75 years of life
      difference(time_keys.first.date,time_keys.second.date)/number_of_seconds_in_a_lifetime
    else
      0
    end
  end
  
  # Returns the number of pixels in the big picture of life for this time frame
  def big_picture_length
    length*3 # change later to depend on length of time
    # 234
  end
  
  private
    # absolute value of difference between 2 dates in seconds
    def difference date1, date2
      (date1.to_datetime() - date2.to_datetime()).abs
    end
end
