class Diary < ApplicationRecord
  belongs_to :user
  belongs_to :square
  belongs_to :plan
  has_many :comments

end
