class GroupsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :index]
  before_action :find_group, only: [:show]
  RESULT_ALL = Hash.new { |hash, key| hash[key] = 0 }

  def index
  end

  def show
    # probleme des votes = le hash @result_all qui doit contenir tout les resultats de votes pour chaque event en a qu'un seul
    # RESULT_ALL.nil? ? RESULT_ALL = {} : RESULT_ALL
    @group = Group.find(params[:id])
    @user_groups_members = UserGroup.where(group: @group)
     # do |user_groups_member|
     #      user_groups_member.user
    @members = @user_groups_members.map(&:user)
    @group.event_users.each_with_index do |event_user, index|
      RESULT_ALL["#{event_user.event_id}"] = event_user.score


      p RESULT_ALL
      # raise
    end
    # raise
    # p RESULT_ALL
    @result_all = RESULT_ALL.max_by{|k,v| v}
    # raise
  end

  def new
    @group = Group.new
  end

  def create
    cookies[:date_start] = params["group"]["date_event"]
    cookies[:address] = params["group"]["location"]
    params[:date_start] = cookies[:date_start]
    params[:address] = cookies[:address]
    # emails = []
    params["invit-email"].nil? ? emails = [] : emails = params["invit-email"]
    emails << params["group"]["email"]
    # emails = emails.map(&:inspect).join(', ').to_a

    @group = Group.new(group_params)
    @group.email = emails
    # cookies[:date_start] = @group.date_event
    # @group.user = current_user
    if @group.save
      @group.users << current_user
      JSON.parse(@group.email).each do |email|
        mail = UserMailer.with(email: email, group: @group).send_invitation
        mail.deliver_now
      end
      redirect_to group_path(@group)
    else
      render :new
    end
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
