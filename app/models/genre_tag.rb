class GenreTag < ApplicationRecord

  has_many :review_genre_tags, dependent: :destroy
  has_many :genre_tags, through: :review_genre_tags

end
