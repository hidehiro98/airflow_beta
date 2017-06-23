class Request < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :receivers
  has_many :users, through: :receivers

  validates :content, :user, :duedate, presence: true

  enum status: { pending: 0, accepted: 1, rejected: 2, commented: 3, canceled: 4 }

  scope :open, -> { where(status: [:pending, :commented]) }
  scope :closed, -> { where(status: [:accepted, :rejected, :canceled]) }

  def check_status
    accepted! if receivers.all?(&:accepted?)
  end

end
