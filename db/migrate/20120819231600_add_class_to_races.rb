class AddClassToRaces < ActiveRecord::Migration
  def change
    add_column :races, :masters, :boolean
    add_column :races, :youth, :boolean
    add_column :races, :u23, :boolean
    add_column :races, :seniors, :boolean
    add_column :races, :juniors, :boolean
    remove_column :races, :age_class
  end
end
