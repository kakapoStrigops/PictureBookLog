class GenreTag < ApplicationRecord

  has_many :review_genre_tags, dependent: :destroy

end
