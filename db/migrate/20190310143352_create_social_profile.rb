class CreateSocialProfile < ActiveRecord::Migration[5.0]
  def change
    create_table :social_profiles do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.references :user, foreign_key: true
    end
  end
end
