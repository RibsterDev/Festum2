class GroupsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :new]

  def index
  end

  def show
  end

  def new
    @group = Group.new
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
