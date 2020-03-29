class RemoveCompanyIdFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_reference :posts, :company_id, foreign_key: true
  end
end
