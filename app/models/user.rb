class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :photo, PhotoUploader

  belongs_to :team
  has_many :requests
  has_many :comments, as: :author
  has_many :receivers
  has_many :received_requests, through: :receivers, source: :request

  validates :first_name, presence: true, uniqueness: { scope: [:last_name, :team] }
  validates :last_name, :team, presence: true

  def name
    "#{first_name} #{last_name}"
  end
end
