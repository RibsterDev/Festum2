class GroupsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]

  def index
  end

  def show
  end

  def new
  end

  def create
    @group = Group.new
    @group.save
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
