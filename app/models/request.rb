class Request < ApplicationRecord
  belongs_to :user
  has_many :comments

  enum status: { default: 0, accepted: 1, rejected: 2, commented: 3 }
end
