class Post < ApplicationRecord
validates :title, presence: true,uniqueness: { scope: :company_id }    
validates :contents, presence: true,uniqueness: { scope: :company_id }    
belongs_to :company
default_scope -> { order(created_at: :desc) }
end
