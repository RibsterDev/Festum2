class GroupsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :index]
  before_action :find_group, only: [:show]

  def index
    # @group = Group.find(params["format"])
    # # @event = EventUser.find(params["format"])
    # # @event = @event.event_id
    # # params.each_key { |event_id| @result_total = params[event_id] }
    # #   @result_total = params[event_id]
    # @group.event_users.id.each do |event_id|
    #   @result_total.nil? ? @result_total = params[event_id] : @result_total << params[event_id]
    # end
    # raise
  end

  def show
    @group = Group.find(params[:id])
    @user_groups_members = UserGroup.where(group: @group)
     # do |user_groups_member|
     #      user_groups_member.user
    @members = @user_groups_members.map(&:user)
  end

  def new
    @group = Group.new
  end

  def create
    cookies[:date_start] = params["group"]["date_event"]
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
        mail = UserMailer.with(email: email, group: @group).send_invitation
        mail.deliver_now
      end
      redirect_to group_path(@group)

    else
      render :new
    end

    # join(params)
  end

  def my_groups
    @my_groups = current_user.groups
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
