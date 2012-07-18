class AddNameToRiders < ActiveRecord::Migration
  def change
    add_column :riders, :first, :string
    add_column :riders, :last, :string
  end
end
