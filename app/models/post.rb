class Post < ApplicationRecord
    validates :title, presence: true, uniqueness: { scope: :user_id }    
    validates :contents, presence: true, uniqueness: { scope: :user_id }    
    belongs_to :user
end
