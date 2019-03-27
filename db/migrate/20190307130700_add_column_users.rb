class AddColumnUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :payjp_id, :string
  end
end
