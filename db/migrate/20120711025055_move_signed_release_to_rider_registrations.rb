class MoveSignedReleaseToRiderRegistrations < ActiveRecord::Migration
  def up
    add_column :rider_registrations, :signed_release, :boolean
    remove_column :entries, :signed_release

  end

  def down
    remove_column :rider_registrations, :signed_release
    add_column :entries, :signed_release, :boolean
  end
end
