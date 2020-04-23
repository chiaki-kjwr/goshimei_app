class RemoveCompanyIdFronPosts < ActiveRecord::Migration[5.2]
  def change
    remove_reference :posts, :company, foreign_key: true
  end
end
