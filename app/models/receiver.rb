class Receiver < ApplicationRecord
  belongs_to :user
  belongs_to :request
  has_many :comments, as: :author

  validates :request, :user, presence: true
  validates :user, uniqueness: { scope: :request }

  enum status: { pending: 0, accepted: 1, rejected: 2, commented: 3, deleted: 4 }
  scope :replied, -> { where(status: [:accepted, :rejected, :commented]) }
end
