class Review < ApplicationRecord

  belongs_to :member
  has_many :comments, dependent: :destroy
  has_many :review_genre_tags, dependent: :destroy
  has_many :genre_tags, through: :review_genre_tags
  has_many :review_target_age_tags, dependent: :destroy
  has_many :target_age_tags, through: :review_target_age_tags

  def save_genre_tag(genre_tags)
    current_genre_tags = self.genre_tags unless self.genre_tags.nil?
    old_genre_tags = current_genre_tags - genre_tags
    new_genre_tags = genre_tags - current_genre_tags

    p current_genre_tags

    old_genre_tags.each do |old|
      self.genre_tags.delete GenreTag.find(old)
    end

    new_genre_tags.each do |new|
      new_post_tag = PostTag.find_or_create_by(id: new.id)
      self.genre_tags << new_post_tag
    end
  end


end
