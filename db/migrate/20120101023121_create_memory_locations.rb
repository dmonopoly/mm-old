class CreateMemoryLocations < ActiveRecord::Migration
  def change
    create_table :memory_locations do |t|
      t.integer :memory_id
      t.integer :location_id
      
      t.timestamps
    end
  end
end
