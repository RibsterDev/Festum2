class EventUsersController < ApplicationController
  def new
    @event_user = EventUser.new
    @group = Group.find(params[:group_id])
    @events = EventHome.new(cookies).home
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
