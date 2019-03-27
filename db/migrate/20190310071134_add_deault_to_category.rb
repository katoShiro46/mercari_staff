class AddDeaultToCategory < ActiveRecord::Migration[5.0]
  def change
    change_column_default :categories, :pick_up, false
    change_column_null :categories, :pick_up, false
  end
end
