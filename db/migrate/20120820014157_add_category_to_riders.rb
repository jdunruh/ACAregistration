class AddCategoryToRiders < ActiveRecord::Migration
  def change
    add_column :riders, :category, :integer
  end
end
