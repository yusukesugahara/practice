class Square < ApplicationRecord
  has_many :diaries, dependent: :destroy
  belongs_to :user

  validates_presence_of :name, :user_id
end
