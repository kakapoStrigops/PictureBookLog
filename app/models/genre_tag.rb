class GenreTag < ApplicationRecord

  has_many :review_genre_tags, dependent: :destroy, foreign_key: 'genre_tag_id'
  has_many :genre_tags, through: :review_genre_tags

end
