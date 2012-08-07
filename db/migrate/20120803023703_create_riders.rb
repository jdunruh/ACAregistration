class CreateRiders < ActiveRecord::Migration
  def change
    drop_table :riders
    create_table :riders do |t|
      t.boolean :suspended
      t.integer :license_number
      t.string :last_name
      t.string :first_name
      t.string :city
      t.string :state
      t.boolean :female
      t.integer :racing_age
      t.date :exp_date
      t.string :rd_club
      t.string :rd_team
      t.string :track_club
      t.string :track_team
      t.string :cx_club
      t.string :cx_team
      t.string :intl_team
      t.string :ncca_club
      t.integer :road_cat
      t.integer :track_cat
      t.integer :cross_cat
      t.date :birthdate
      t.boolean :citizen
      t.string :emergency_contact
      t.string :e_contact_phone

      t.timestamps
    end
  end
end
