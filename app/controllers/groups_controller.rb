class GroupsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :index]
  before_action :find_group, only: [:show]

  def index
  end

  def show
  end

  def new
    cookies[:date_start] = params[:date_event]
    cookies[:address] = params[:location].capitalize if params.key? :location
    @group = Group.new
  end

  def create
    cookies[:date_start] = params[:date_event]
    cookies[:address] = params[:location].capitalize if params.key? :location
    # emails = []
    emails = params["invit-email"]
    emails << params["group"]["email"]
    # emails = emails.map(&:inspect).join(', ').to_a

    @group = Group.new(group_params)
    @group.email = emails
    # @group.user = current_user
    if @group.save
      mail = UserMailer.with(user: @user).send_invitation(@group)
      mail.deliver_later
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
