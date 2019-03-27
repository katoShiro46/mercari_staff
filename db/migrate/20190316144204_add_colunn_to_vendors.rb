class AddColunnToVendors < ActiveRecord::Migration[5.0]
  def change
    add_column :vendors, :first_name_phonetic, :string
    add_column :vendors, :family_name_phonetic, :string
  end
end
