class VotesController < ApplicationController

  def index
    @group = Group.find(params[:group_id])

  end

  # def score
  #   score_total << params[:votes_result]
  # end


# cree vote new et vote save
end
