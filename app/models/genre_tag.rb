class GenreTag < ApplicationRecord

  has_many :review_genre_tags, dependent: :destroy
  has_many :reviews, through: :review_genre_tags

end
