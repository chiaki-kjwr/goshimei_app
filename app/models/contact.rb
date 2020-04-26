class Contact < ApplicationRecord
  validates :contents, presence: true
  validates :name, presence: true

end
