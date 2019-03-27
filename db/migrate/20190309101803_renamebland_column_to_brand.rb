class RenameblandColumnToBrand < ActiveRecord::Migration[5.0]
  def change
    rename_column :brands, :brand, :name
  end
end
