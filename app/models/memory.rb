class Memory < ActiveRecord::Base
  has_many :memory_time_frames
  has_many :time_frames, :through => :memory_time_frames
  belongs_to :location
  
  accepts_nested_attributes_for :time_frames, :allow_destroy => true
  # accepts_nested_attributes_for :location, :allow_destroy => true makes toggle fail...
  
  validates_presence_of :content
  # validates_length_of :content, :maximum => 140
  
  def time_frame_representation
    time_frames[0].representation unless time_frames[0].nil?
  end
  
end