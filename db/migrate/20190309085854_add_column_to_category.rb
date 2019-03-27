class AddColumnToCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :pick_up, :boolean
  end
end
