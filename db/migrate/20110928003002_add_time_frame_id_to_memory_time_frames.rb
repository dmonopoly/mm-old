class AddTimeFrameIdToMemoryTimeFrames < ActiveRecord::Migration
  def change
    add_column :memory_time_frames, :time_frame_id, :integer
  end
end
