class RemoveQuestionMarksFromFieldNames < ActiveRecord::Migration
  def up
    rename_column :entries, :signed_release?, :signed_release
    rename_column :races, :women?, :women
    rename_column :races, :age_class?, :age_class
    rename_column :races, :all_categories?, :all_categories
  end

  def down
  end
end
