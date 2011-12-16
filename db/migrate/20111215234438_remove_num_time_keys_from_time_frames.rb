class RemoveNumTimeKeysFromTimeFrames < ActiveRecord::Migration
  def up
    remove_column :time_frames, :num_time_keys
  end

  def down
    add_column :time_frames, :num_time_keys, :int
  end
end
