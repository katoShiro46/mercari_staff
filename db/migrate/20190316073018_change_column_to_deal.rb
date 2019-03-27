class ChangeColumnToDeal < ActiveRecord::Migration[5.0]
  def change
    change_column :deals, :string, :integer
  end
end
