class CreatePost < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :company,foreign_key: true
      t.text :title
      t.text :contents
    end
  end
end
