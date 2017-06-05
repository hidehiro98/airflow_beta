class Request < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :content, :user, :duedate, presence: true

  enum status: { pending: 0, accepted: 1, rejected: 2, commented: 3 }
end
