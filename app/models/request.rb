class Request < ApplicationRecord
  belongs_to :user
  has_many :comments

  enum status: { pending: 0, accepted: 1, rejected: 2, commented: 3 }
end
