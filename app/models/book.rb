class Book < ApplicationRecord

  has_many :candidate_posts, dependent: :destroy
  has_many :reviews, dependent: :destroy

end
