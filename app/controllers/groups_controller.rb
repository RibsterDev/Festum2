class GroupsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :index]
  before_action :find_group, only: [:show]

  def index
    @event = Group.find(params["format"])
    @event = @event.event_users
    @event.each do |event_id|
      @result_total = params[event_id]
    end
  end

  def show
  end

  def new
    @group = Group.new
  end

  def create

    cookies[:date_start] = "#{params["group"]["date_event(1i)"]}-#{params["group"]["date_event(2i)"]}-#{params["group"]["date_event(3i)"]}"
    cookies[:address] = params["group"]["location"]
    # emails = []
    params["invit-email"].nil? ? emails = [] : emails = params["invit-email"]
    emails << params["group"]["email"]
    # emails = emails.map(&:inspect).join(', ').to_a


    @group = Group.new(group_params)
    @group.email = emails
    # cookies[:date_start] = @group.date_event
    # @group.user = current_user
    if @group.save
      JSON.parse(@group.email).each do |email|
        mail = UserMailer.with(email: email).send_invitation
        mail.deliver_now
      end
      redirect_to group_path(@group)

    else
      render :new
    end

    # join(params)
  end

  def update
  end

  def edit
  end

  def destroy
  end




  private

  def join
  end

  def find_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :date_event, :location, :email, :vote_duration, :proposition_duration)
  end
end
