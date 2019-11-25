class UserGroupsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @group = Group.find(params[:group_id])
    @user_group = UserGroup.create(user: @user, group: @group)

    redirect_to group_path(@group)
  end

end
