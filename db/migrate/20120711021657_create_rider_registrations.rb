class CreateRiderRegistrations < ActiveRecord::Migration
  def change
    create_table :rider_registrations do |t|
      t.integer :rider_id
      t.integer :entry_id

      t.timestamps
    end
  end
end
