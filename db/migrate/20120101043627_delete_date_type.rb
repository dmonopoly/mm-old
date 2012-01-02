class DeleteDateType < ActiveRecord::Migration
  def up
    remove_column :time_frames, :first_date_type
    remove_column :time_frames, :second_date_type
  end

  def down
    add_column :time_frames, :first_date_type, :integer
    add_column :time_frames, :second_date_type, :integer
  end
end
