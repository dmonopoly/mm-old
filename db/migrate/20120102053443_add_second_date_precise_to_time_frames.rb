class AddSecondDatePreciseToTimeFrames < ActiveRecord::Migration
  def change
    add_column :time_frames, :second_date_precise, :boolean
  end
end
