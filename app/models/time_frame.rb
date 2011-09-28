class TimeFrame < ActiveRecord::Base
  has_many :memory_time_frames
  has_many :memories, :through => :memory_time_frames
  
  # accepts_nested_attributes_for :memories
  
  has_many :time_keys
end
