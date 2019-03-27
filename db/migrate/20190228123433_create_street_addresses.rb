class CreateStreetAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :street_addresses do |t|
      t.string :post_number
      t.integer :prefecture_id
      t.string :city
      t.string :address
      t.string :building_name
      t.references :user,foreign_key: true
      t.timestamps
    end
  end
end
