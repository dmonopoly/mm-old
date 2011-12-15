class TimeKey < ActiveRecord::Base
  belongs_to :time_frame
  
  validates_inclusion_of :type, :in => [1,2], :message => "Invalid type for time key."
end
