class AddColumnToBrand < ActiveRecord::Migration[5.0]
  def change
    add_column :brands, :pick_up, :boolean
  end
end
