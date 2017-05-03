class VoteOption < ActiveRecord::Base
  #belongs_to :poll
  belongs_to :poll, optional: true, required: false
  validates :title, presence: true
  has_many :votes, dependent: :destroy
end
