class CreateTimeKeys < ActiveRecord::Migration
  def change
    create_table :time_keys do |t|
      t.date :date

      t.timestamps
    end
  end
end