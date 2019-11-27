class UserGroupsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @group = Group.find(params[:group_id])
    @user_group = UserGroup.create(user: @user, group: @group)

    message = "#{@user.email} à rejoint le groupe #{@group.name}"
    ActionCable.server.broadcast("group_#{@group.id}", { user: @user, photo: helpers.image_path(@user.photo), flash_message: message })

    redirect_to group_path(@group)
  end

end
