class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email,null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.string :name,null: false
      t.string :profile_photo, null: false
      t.integer :age
      t.string :sex
      t.text :profile
    end
  end
end
