class AddMemoryIdToMemoryTimeFrames < ActiveRecord::Migration
  def change
    add_column :memory_time_frames, :memory_id, :integer
  end
end
