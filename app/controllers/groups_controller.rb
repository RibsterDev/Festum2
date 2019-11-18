class GroupsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :categories, :show]
  def index
  end

  def show
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new
    # creator = @user.id
    if @group.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
