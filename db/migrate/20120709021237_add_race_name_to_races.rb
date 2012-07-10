class AddRaceNameToRaces < ActiveRecord::Migration
  def change
    add_column :races, :name, :string
  end
end
