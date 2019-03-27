class RenameColumnToDeal < ActiveRecord::Migration[5.0]
  def change
    rename_column :deals, :string, :status
  end
end
