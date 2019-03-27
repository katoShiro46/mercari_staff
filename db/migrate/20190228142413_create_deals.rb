class CreateDeals < ActiveRecord::Migration[5.0]
  def change
    create_table :deals do |t|
      t.string :string,null: false
      t.references :user,foreign_key: true
      t.references :item,foreign_key: true
      t.references :vendor,foreign_key: true
      t.timestamps
    end
  end
end
