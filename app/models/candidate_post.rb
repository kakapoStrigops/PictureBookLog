class CandidatePost < ApplicationRecord

  enum consideration_status: { consideration: 0, decision: 1, pending: 2, purchased: 3}

  belongs_to :member

  validates :memo, length: {maximum: 100}

end