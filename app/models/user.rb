class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates :account, presence: true, uniqueness: true
  validates :email, presence: true
  validates :encrypted_password, presence: true

  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy


  def avatar_image
    if profile&.avatar&.attached?
      profile.avatar
    else
      'default.jpeg'
    end
  end
end
