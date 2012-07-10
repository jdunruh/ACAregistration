class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :race_id
      t.integer :rider_id
      t.boolean :signed_release?

      t.timestamps
    end
  end
end
