class EventUser < ApplicationRecord
  belongs_to :event
  belongs_to :group
  belongs_to :user
  has_many :votes

end
