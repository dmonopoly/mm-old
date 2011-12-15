class AddNumTimeKeysToTimeFrames < ActiveRecord::Migration
  def change
    add_column :time_frames, :num_time_keys, :int
  end
end
