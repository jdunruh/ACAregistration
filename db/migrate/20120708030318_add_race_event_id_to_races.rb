class AddRaceEventIdToRaces < ActiveRecord::Migration
  def change
    add_column :races, :race_event_id, :integer
  end
end
