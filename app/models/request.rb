class Request < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :receivers
  has_many :users, through: :receivers

  validates :content, :user, :duedate, presence: true

  enum status: { pending: 0, accepted: 1, rejected: 2, commented: 3, canceled: 4, deleted: 5 }

  scope :open, -> { where(status: [:pending, :commented]) }
  scope :closed, -> { where(status: [:accepted, :rejected, :canceled]) }

  def check_status
    accepted! if receivers.all?(&:accepted?)
    rejected! if receivers.any?(&:rejected?)
  end

  def delete_receivers
    receivers.each(&:deleted!)
  end

end
