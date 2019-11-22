class VotesController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
  end
end
