class CreateMemoryTimeFrames < ActiveRecord::Migration
  def change
    create_table :memory_time_frames do |t|
      t.timestamps
    end
  end
end
