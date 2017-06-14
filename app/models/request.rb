class Request < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :receivers
  has_many :users, through: :receivers

  validates :content, :user, :duedate, presence: true

  enum status: { pending: 0, accepted: 1, rejected: 2, commented: 3 }

  def check_status
    check = false

    receivers.each do |receiver|
      if receiver.status == 'accepted'
        check = true
      else
        check = false
        break
      end
    end

    accepted! if check
  end

end
