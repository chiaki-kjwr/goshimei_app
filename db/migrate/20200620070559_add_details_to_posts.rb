class AddDetailsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :created_at, :datetime,null: true
    add_column :posts, :updated_at, :datetime,null: true
  end
end
