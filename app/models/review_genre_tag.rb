class ReviewGenreTag < ApplicationRecord

  belongs_to :review
  belongs_to :genre_tag

end
