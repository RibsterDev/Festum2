class Group < ApplicationRecord
  has_many :event_users
  has_many :users, through: :user_groups
  has_many :events, through: :event_users
end
