class VoteOption < ActiveRecord::Base
  #belongs_to :poll
  belongs_to :poll, optional: true
  validates :title, presence: true
  has_many :votes, dependent: :destroy
end
