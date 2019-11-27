class GroupChannel < ApplicationCable::Channel
  def subscribed
    ap current_user.email
    current_user.groups.each do |group|
      stream_from "group_#{group.id}"
    end
  end
end
