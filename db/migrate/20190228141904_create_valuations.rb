class CreateValuations < ActiveRecord::Migration[5.0]
  def change
    create_table :valuations do |t|
      t.string :satisfaction_level,null: false
      t.text :comment,null: false
      t.references :user,foreign_key: true
      t.references :vendor,foreign_key: true
      t.timestamps
    end
  end
end
