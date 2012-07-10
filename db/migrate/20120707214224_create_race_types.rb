class CreateRaceTypes < ActiveRecord::Migration
  def change
    create_table :race_types do |t|
      t.string :type

      t.timestamps
    end
  end
end
