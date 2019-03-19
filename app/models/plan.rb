class Plan < ApplicationRecord
belongs_to :group
has_many :diarise
end
