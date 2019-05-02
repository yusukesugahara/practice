class Diary < ApplicationRecord
  belongs_to :user
  belongs_to :square
  belongs_to :plan

end
