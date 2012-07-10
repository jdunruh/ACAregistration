class CreateRiders < ActiveRecord::Migration
  def change
    create_table :riders do |t|
      t.string :license_number
      t.boolean :citizen
      t.string :sex
      t.string :state
      t.integer :racing_age
      t.integer :rd_cat
      t.integer :cx_cat
      t.integer :dh_cat
      t.integer :mx_ds_cat
      t.integer :ot_cat
      t.string :rd_club
      t.string :tk_club
      t.string :cx_club
      t.date :birthdate

      t.timestamps
    end
  end
end
