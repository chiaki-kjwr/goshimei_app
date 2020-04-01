class AddUserToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :user, :refereces,foreign_key: true
  end
end
