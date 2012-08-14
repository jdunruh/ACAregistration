class AddOneDayToRiders < ActiveRecord::Migration
  def change
    add_column :riders, :one_day, :boolean
  end
end
