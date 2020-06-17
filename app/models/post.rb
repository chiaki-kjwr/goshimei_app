class Post < ApplicationRecord
  validates :title, presence: true, uniqueness: { scope: :company_id }
  validates :contents, presence: true, uniqueness: { scope: :company_id }
  belongs_to :company
  has_many :likes, dependent: :destroy

  def liked_by(user)
    Like.find_by(post_id: id)
  end


  def Post.search(search, company_or_post)
    if company_or_post == "2"
      Post.where(['title LIKE ?', "%#{search}%"])
    else
      Post.all
    end
  end

  def self.csv_attributes
    ["title", "contents"]
  end

  def self.generate_csv
    CSV.generate(headers: true) do |csv|
      csv << csv_attributes
      all.each do |post|
        csv << csv_attributes.map { |attr| post.send(attr) }
      end
    end
  end
end
