class CreateMemories < ActiveRecord::Migration
  def change
    create_table :memories do |t|
      t.text :content
      t.timestamps
    end
  end
end
