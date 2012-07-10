class RenameTypeInRaceTypes < ActiveRecord::Migration
  def up
    rename_column :race_types, :type, :race_type
    add_column :race_types, :race_type_abbreviation, :string
  end

  def down
  end
end
