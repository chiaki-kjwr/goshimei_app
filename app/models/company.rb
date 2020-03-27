class Company < ApplicationRecord
    has_many :posts, dependent: :destroy
end
