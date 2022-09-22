class Comment < ApplicationRecord

  enum hidden_status: { open: false, hidden: true }

  belongs_to :member
  belongs_to :review

  validates :comment, presence: true, length: {maximum: 1000}

end