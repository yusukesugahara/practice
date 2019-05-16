class Diary < ApplicationRecord
  belongs_to :user
  belongs_to :square
  belongs_to :plan
  has_many :comments

  validates_presence_of :user_id, :square_id ,:plan_id, :text
  validates :text,    length: { maximum: 10000 }
end
