class ReviewGenreTag < ApplicationRecord

  belongs_to :review
  belongs_to :genre_tag

  validates :review_id, presence: true
  validates :genre_tag_id, presence: true

end
