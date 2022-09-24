class Review < ApplicationRecord

  enum hidden_status: { open: false, hidden: true }

  belongs_to :member
  has_many :comments, dependent: :destroy
  has_many :review_genre_tags, dependent: :destroy
  has_many :genre_tags, through: :review_genre_tags
  has_many :review_target_age_tags, dependent: :destroy
  has_many :target_age_tags, through: :review_target_age_tags

  validates :review, length: {maximum: 3000}
  scope :displayable, -> { where(hidden_status: false).where("LENGTH(review) >= ?", 1) }

  def self.search_for(parameter, keyword)
    if parameter == "title"
      Review.displayable.where("title LIKE?", "%#{keyword}%")
    elsif parameter == "author"
      Review.displayable.where("author LIKE?", "%#{keyword}%")
    elsif parameter == "publisherName"
      Review.displayable.where("publisher LIKE?", "%#{keyword}%")
    elsif parameter == "isbn"
      Review.displayable.where(isbn_code: keyword)
    else
      Review.displayable
    end
  end

end
