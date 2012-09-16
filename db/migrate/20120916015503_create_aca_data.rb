class CreateAcaData < ActiveRecord::Migration
  def change
    create_table :aca_data do |t|
      t.integer :aca_number
      t.integer :usac_number
      t.boolean :has_transponder

      t.timestamps
    end
  end
end
