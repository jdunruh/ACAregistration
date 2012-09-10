class AddRaceTypeColumnToRaceTypes < ActiveRecord::Migration
  def change
    add_column :race_types, :race_type_column, :string
  end
end
