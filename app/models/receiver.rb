class Receiver < ApplicationRecord
  belongs_to :user
  belongs_to :request
  has_many :comments, as: :author
end
