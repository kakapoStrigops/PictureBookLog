class TargetAgeTag < ApplicationRecord

  has_many :review_target_age_tags, dependent: :destroy

end
