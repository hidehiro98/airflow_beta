class Request < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :receivers

  validates :content, :user, :duedate, presence: true

  enum status: { pending: 0, accepted: 1, rejected: 2, commented: 3 }
end
