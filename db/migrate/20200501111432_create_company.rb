class CreateCompany < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :email,null: false
      t.string :name,null: false
      t.string :profile_photo, null: false
      t.text :profile
    end
  end
end
