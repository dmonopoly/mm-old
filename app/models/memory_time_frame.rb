class MemoryTimeFrame < ActiveRecord::Base
  belongs_to :memory
  belongs_to :time_frame
end
