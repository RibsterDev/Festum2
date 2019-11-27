class Group < ApplicationRecord
  has_many :event_users
  has_many :user_groups
  has_many :users, through: :user_groups
  has_many :events, through: :event_users
  has_many :votes, through: :event_users

  def waiting_for_events?
    users.count > events.count
    # ||
    #   (created_at + proposition_duration.days) < DateTime.current
  end

  def waiting_for_votes?
    users.count * events.count > votes.count
    # ||
    #   ((created_at - proposition_duration) + vote_duration.days) < DateTime.current
  end

  def finish?
   users.count * events.count == votes.count
  end
end
