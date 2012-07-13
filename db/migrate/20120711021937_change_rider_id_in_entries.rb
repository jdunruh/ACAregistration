class ChangeRiderIdInEntries < ActiveRecord::Migration
  def up
    rename_column :entries, :rider_id, :rider_registration_id
  end

  def down
    rename_column :entries, :rider_registration_id, :rider_id
  end
end
