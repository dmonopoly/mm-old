class Memory < ActiveRecord::Base
  has_many :memory_time_frames
  has_many :time_frames, :through => :memory_time_frames

  accepts_nested_attributes_for :time_frames, :allow_destroy => true # without allow destroy, the "remove" check box won't work
  
  def time_frame_representation
    time_frames[0].representation unless time_frames[0].nil?
  end
end