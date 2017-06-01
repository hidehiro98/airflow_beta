class Receiver < ApplicationRecord
  belongs_to :user
  belongs_to :request
  has_many :comments, as: :author

  enum status: { default: 0, accepted: 1, rejected: 2, commented: 3 }
end
