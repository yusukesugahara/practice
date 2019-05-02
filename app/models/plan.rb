class Plan < ApplicationRecord
  has_many :diarise
  belongs_to :user
end
