class MemoryTimeFrame < ActiveRecord::Base
  belongs_to :memory
  belongs_to :time_frame
  
  accepts_nested_attributes_for :time_frame
end