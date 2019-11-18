class GroupsController < ApplicationController
<<<<<<< HEAD
  skip_before_action :authenticate_user!, only: [:create]

=======
  skip_before_action :authenticate_user!, only: [:home, :index, :categories, :show]
>>>>>>> bd6279c0b778336e0c34396d4964a99198edc9e5
  def index
  end

  def show
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new
<<<<<<< HEAD
    @group.save
=======
    # creator = @user.id
    if @group.save
      redirect_to group_path(@group)
    else
      render :new
    end
>>>>>>> bd6279c0b778336e0c34396d4964a99198edc9e5
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
