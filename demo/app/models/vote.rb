class Vote < ActiveRecord::Base
  belongs_to :vote_option,required: false
end
