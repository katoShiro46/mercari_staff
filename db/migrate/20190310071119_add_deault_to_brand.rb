class AddDeaultToBrand < ActiveRecord::Migration[5.0]
  def change
    change_column_default :brands, :pick_up, false
    change_column_null :brands, :pick_up, false
  end
end
