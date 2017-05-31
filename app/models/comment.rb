class Comment < ApplicationRecord
  belongs_to :request
  belongs_to :author, polymorphic: true

  validates :content, presence: true
end
