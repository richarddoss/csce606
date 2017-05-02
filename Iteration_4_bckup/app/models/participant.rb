class Participant < ApplicationRecord
  belongs_to :user ,required: false
end
