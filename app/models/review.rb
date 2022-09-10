class Review < ApplicationRecord

  belongs_to :member
  has_many :comments, dependent: :destroy
  has_many :review_genre_tags, dependent: :destroy
  has_many :review_target_age_tags, dependent: :destroy

end
