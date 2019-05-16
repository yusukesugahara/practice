class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :diary

  validates_presence_of :user_id ,:diary_id, :text
  validates :text,  length: { maximum: 1000 }
end
