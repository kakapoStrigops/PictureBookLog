class TargetAgeTag < ApplicationRecord

  has_many :review_target_age_tags, dependent: :destroy
  has_many :target_age_tags, through: :review_target_age_tags

end
