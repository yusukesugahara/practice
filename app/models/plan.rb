class Plan < ApplicationRecord
  has_many :diaries, dependent: :destroy
  belongs_to :user
end
