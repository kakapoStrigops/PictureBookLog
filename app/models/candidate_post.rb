class CandidatePost < ApplicationRecord

  enum consideration_status: { consideration: 0, decision: 1, pending: 2, purchased: 3}

  belongs_to :member

  validates :memo, length: {maximum: 100}

  scope :recent, -> (count) { order(updated_at: :desc).limit(count) }
  scope :extract, -> (member, status) { where(member_id: member.id, consideration_status: status) }

end