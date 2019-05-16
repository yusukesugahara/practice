class Diary < ApplicationRecord
  belongs_to :user
  belongs_to :square
  belongs_to :plan
  has_many :comments

  validates_presence_of :text, :user_id, :square_id ,:plan_id
  validates :text,    length: { maximum: 10000 }
end
