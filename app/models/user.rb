class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable,invite_for: 24.hours

  mount_uploader :image, ImageUploader

  has_many :squares, dependent: :destroy
  has_many :plan, dependent: :destroy
  has_many :groups, through: :user_groups
  has_many :user_groups, dependent: :destroy
  has_many :diaries, dependent: :destroy

  validates :nickname ,presence: true

end
