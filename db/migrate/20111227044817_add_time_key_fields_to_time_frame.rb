class AddTimeKeyFieldsToTimeFrame < ActiveRecord::Migration
  def change
    add_column :time_frames, :first_date, :date
    add_column :time_frames, :first_date_type, :integer
    add_column :time_frames, :second_date, :date
    add_column :time_frames, :second_date_type, :integer
  end
end
