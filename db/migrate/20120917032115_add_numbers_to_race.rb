class AddNumbersToRace < ActiveRecord::Migration
  def change
    add_column :races, :starting_number, :integer
    add_column :races, :next_number, :integer
    add_column :races, :field_limit, :integer
  end
end
