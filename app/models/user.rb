class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         invite_for: 24.hours

  has_many :user_groups
  has_many :groups, through: :user_groups

  has_many :authoritys

  has_many :squares
end
