class TimeFrame < ActiveRecord::Base
  has_many :memory_time_frames
  has_many :memories, :through => :memory_time_frames
  
  # accepts_nested_attributes_for :memories - needed if you have a form mainly for time_frames but with nested memories
  default_scope :order => 'representation ASC'
  
  has_many :time_keys
  
  # Returns the number of pixels in the big picture of life for this time frame
  def big_picture_length
    rand 50 # change later to depend on length of time
  end
end
