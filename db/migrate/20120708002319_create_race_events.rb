class CreateRaceEvents < ActiveRecord::Migration
  def change
    create_table :race_events do |t|
      t.string :name
      t.date :date
      t.integer :race_type_id

      t.timestamps
    end
  end
end
