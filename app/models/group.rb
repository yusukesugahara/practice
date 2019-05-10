class Group < ApplicationRecord
  has_many :users, through: :user_groups
  has_many :user_groups
  has_many :plans

  accepts_nested_attributes_for :user_groups, allow_destroy: true

  validates_presence_of :name
end
