class AddXponderToRiders < ActiveRecord::Migration
  def change
    add_column :riders, :xponder, :integer
  end
end
