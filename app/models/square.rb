class Square < ApplicationRecord
  has_many :diaries
  belongs_to :user
end
