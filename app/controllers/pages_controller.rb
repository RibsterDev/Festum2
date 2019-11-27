class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
     # ActionCable.server.broadcast("group_2", {toto: 'titi'})
  end
end
