class RemoveLocationIdFromMemories < ActiveRecord::Migration
  def up
    remove_column :memories, :location_id
  end

  def down
    add_column :memories, :location_id, :integer
  end
end
