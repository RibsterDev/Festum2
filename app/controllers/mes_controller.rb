class MesController < ActionController::Base
  # protect_from_forgery with: :exception
  before_action :authenticate_user!

  def list_user_groups
    @user = current_user
    @groups = @user.groups
  end
end
