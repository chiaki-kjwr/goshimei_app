class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.text :contents
      t.references :user,foreign_key: true
    end
  end
end