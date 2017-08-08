class Request < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :receivers, dependent: :destroy
  has_many :users, through: :receivers

  validates :title, :user, :duedate, presence: true

  enum status: { pending: 0, accepted: 1, rejected: 2, commented: 3, canceled: 4 }

  scope :open, -> { where(status: [:pending, :commented]) }
  scope :closed, -> { where(status: [:accepted, :rejected, :canceled]) }

  def check_status
    if receivers.all?(&:accepted?)
      accepted!
      RequestMailer.accepted(self).deliver_now
    elsif receivers.any?(&:rejected?)
      rejected!
      RequestMailer.rejected(self).deliver_now
    end
  end
end
