class CreatePost < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :contents
      t.references :user,foreign_key: true
    end
  end
end
