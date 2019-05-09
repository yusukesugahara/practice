class Plan < ApplicationRecord
  has_many :diaries, dependent: :destroy
  belongs_to :group

  validates_presence_of :date, :name, :text
  validates_date :date
end
