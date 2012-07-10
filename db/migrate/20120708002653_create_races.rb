class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.boolean :women?
      t.integer :min_age
      t.integer :max_age
      t.decimal :entry_fee
      t.integer :min_category
      t.integer :max_category
      t.boolean :age_class?
      t.boolean :all_categories?

      t.timestamps
    end
  end
end
