class AddDetailsToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :industry, :string
    add_column :companies, :occupation, :string
    add_column :companies, :corporation_name, :string
  end
end
