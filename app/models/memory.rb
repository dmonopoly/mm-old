class Memory < ActiveRecord::Base
  attr_accessible :content, :location_tokens
  attr_reader :location_tokens # http://railscasts.com/episodes/258-token-fields
  
  has_many :memory_time_frames
  has_many :time_frames, :through => :memory_time_frames
  has_many :memory_locations
  has_many :locations, :through => :memory_locations
  
  accepts_nested_attributes_for :time_frames, :allow_destroy => true, 
    :reject_if => proc { |attributes| attributes['representation'].blank? } # prevent blank field from creating a tf
  # accepts_nested_attributes_for :memory_time_frames, :allow_destroy => true
  
  accepts_nested_attributes_for :locations, :allow_destroy => true,
    :reject_if => proc { |attributes| attributes['name'].blank? }
  
  validates_presence_of :content
  
  def location_tokens=(ids)
    self.location_ids = ids.split(",")
  end
  
  def time_frame_representation
    time_frames[0].representation unless time_frames[0].nil?
  end
  
end