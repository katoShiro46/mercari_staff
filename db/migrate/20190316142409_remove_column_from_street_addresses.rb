class RemoveColumnFromStreetAddresses < ActiveRecord::Migration[5.0]
  def up
    remove_column :street_addresses, :family_name
    remove_column :street_addresses, :first_name
    remove_column :street_addresses, :family_name_phonetic
    remove_column :street_addresses, :first_name_phonetic
      end

  def down
    add_column :street_addresses, :family_name, :string
    add_column :street_addresses, :first_name, :string
    add_column :street_addresses, :family_name_phonetic, :string
    add_column :street_addresses, :first_name_phonetic, :string
  end
end
