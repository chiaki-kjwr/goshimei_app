class User < ApplicationRecord
  enum role: { user: 1, company: 2 }  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   validates :name, presence: true, length: { maximum: 30 }   


end
