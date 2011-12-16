class AddTimeFrameIdToTimeKeys < ActiveRecord::Migration
  def change
    add_column :time_keys, :time_frame_id, :integer
  end
end
