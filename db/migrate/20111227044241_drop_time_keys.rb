class DropTimeKeys < ActiveRecord::Migration
  def up
    drop_table :time_keys
  end

  def down
    create_table :time_keys do |t|
      t.date :date
      t.integer  :category
      t.integer  :time_frame_id
      t.timestamps
    end
  end
end
