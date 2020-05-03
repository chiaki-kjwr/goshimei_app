class Post < ApplicationRecord
validates :title, presence: true,uniqueness: { scope: :company_id }    
validates :contents, presence: true,uniqueness: { scope: :company_id }    
belongs_to :company
default_scope -> { order(created_at: :desc) }
has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy

def liked_by(user)
  Like.find_by(post_id:id)
end

end
