class AddColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :staff_authority, :boolean,default:0
  end
end
