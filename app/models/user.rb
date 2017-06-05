class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :team
  has_many :requests
  has_many :comments, as: :author

  validates :first_name, presence: true, uniqueness: { scope: :last_name }
  validates :last_name, :team, presence: true
end
