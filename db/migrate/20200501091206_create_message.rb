class CreateMessage < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :message
      t.references :user,foreign_key: true
      t.references :room,foreign_key: true
      t.references :company,foreign_key: true
    end
  end
end
