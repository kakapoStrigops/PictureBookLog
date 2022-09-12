class ReviewTargetAgeTag < ApplicationRecord

  belongs_to :review
  belongs_to :target_age_tag

  validates :review_id, presence: true
  validates :target_age_tag_id, presence: true

end
