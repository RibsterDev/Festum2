class GroupsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :index]
  before_action :find_group, only: [:show]

  def index
  end

  def show
  end

  def new
    @group = Group.new
  end

  def create

    emails = []
    emails << params["group"]["email"]
    emails << params["invit-email"]
    emails.flatten
    emails = emails.to_s
    #finir de formatter

    @group = Group.new(group_params)
    @group.email = emails
    # @group.user = current_user
    if @group.save
      redirect_to group_path(@group)
      # faire partir les mails
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
