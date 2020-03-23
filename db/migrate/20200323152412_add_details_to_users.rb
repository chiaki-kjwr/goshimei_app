class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :age, :string
    add_column :users, :sex, :string
    add_column :users, :profile, :text
  end
end
