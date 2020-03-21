class Contact < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts,:contents,:text
  end
end
