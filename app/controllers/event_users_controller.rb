class EventUsersController < ApplicationController
  def new
    @event_user = EventUser.new
    @group = Group.find(params[:group_id])
    @events = Event.all.limit(5)
  end

  def create
    group = Group.find(params[:group_id])
    event = Event.find(params[:event_id])
    EventUser.create(
      group: group, event: event, user: current_user
    )
    redirect_to group_path(params[:group_id])
  end
end
