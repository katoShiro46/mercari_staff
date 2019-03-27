class AddDefaultIconToUser < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :icon, :string, default:"member_photo_noimage.png"
  end
end
