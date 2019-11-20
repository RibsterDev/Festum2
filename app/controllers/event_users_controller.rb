class EventUsersController < ApplicationController
  def new
    @event_user = EventUser.new
  end

  def create

    redirect_to group_path(@params[:group_id])
  end
end
