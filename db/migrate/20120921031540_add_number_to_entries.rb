class AddNumberToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :number, :integer
  end
end
