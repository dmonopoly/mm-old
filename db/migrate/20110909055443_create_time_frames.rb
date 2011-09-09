class CreateTimeFrames < ActiveRecord::Migration
  def change
    create_table :time_frames do |t|
      t.string :type
      t.string :representation
      t.timestamps
    end
  end
end
