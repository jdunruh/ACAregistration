class AddXponderToRiderRegistrations < ActiveRecord::Migration
  def change
    add_column :rider_registrations, :transponder_number, :integer
  end
end
