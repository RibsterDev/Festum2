class EventUser < ApplicationRecord
  belongs_to :event
  belongs_to :group
  belongs_to :user
end
