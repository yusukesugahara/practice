class Square < ApplicationRecord
  has_many :diaries, dependent: :destroy
  belongs_to :user
end
