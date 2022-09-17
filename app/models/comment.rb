class Comment < ApplicationRecord

  enum hidden_status: { open: false, hidden: true }

  belongs_to :member
  belongs_to :review

end
