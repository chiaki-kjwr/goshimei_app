class Contact < ApplicationRecord
  validates :contents, presence: true
end
