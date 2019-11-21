class EventUsersController < ApplicationController
  def new
    @event_user = EventUser.new
    @group = Group.find(params[:group_id])
    @events = EventHome.new(cookies).home
    @events = @events.geocoded #returns events with coordinates

    @markers = @events.map do |event|
      {
        lat: event.lat,
        lng: event.long,
        # infoWindow: render_to_string(partial: "info_window", locals: { flat: flat })
      }
    end
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
