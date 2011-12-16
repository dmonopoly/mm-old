class TimeKey < ActiveRecord::Base
  belongs_to :time_frame
  
  # later
  validates :type, :numericality => { :only_integer => true, :greater_than => 0, :less_than => 3}
end
