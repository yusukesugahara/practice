class Comment < ApplicationRecord
  belogns_to :user
  belogns_to :diary
end
