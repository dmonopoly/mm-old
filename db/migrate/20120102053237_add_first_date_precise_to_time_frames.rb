class AddFirstDatePreciseToTimeFrames < ActiveRecord::Migration
  def change
    add_column :time_frames, :first_date_precise, :boolean
  end
end
