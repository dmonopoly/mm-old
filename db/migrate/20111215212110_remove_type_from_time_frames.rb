class RemoveTypeFromTimeFrames < ActiveRecord::Migration
  def up
    remove_column :time_frames, :type
  end

  def down
    add_column :time_frames, :type, :string
  end
end
