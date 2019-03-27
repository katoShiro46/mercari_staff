class AddColumnsToStreetAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :street_addresses, :family_name, :string, null: false
    add_column :street_addresses, :first_name, :string, null: false
    add_column :street_addresses, :family_name_phonetic, :string, null: false
    add_column :street_addresses, :first_name_phonetic, :string, null: false
  end

end
