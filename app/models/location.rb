class Location < ActiveRecord::Base
  has_many :memory_locations
  has_many :memories, :through => :memory_locations
  
  validates_presence_of :name
end
