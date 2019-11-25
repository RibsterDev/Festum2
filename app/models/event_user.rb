class EventUser < ApplicationRecord
  belongs_to :event
  belongs_to :group
  belongs_to :user

  has_many :votes

  def score
    points = 0
    nb_votes = 0
    group = Group.find(group_id)
    group.event_users.each do |count|
      nb_votes += 1
    end

    votes.each do |vote|
      points += nb_votes - vote.sort
    end
    points
  end
end
