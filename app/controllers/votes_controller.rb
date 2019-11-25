class VotesController < ApplicationController

  def new
    @group = Group.find(params[:group_id])
  end

  def create
    # @vote = Vote.new(votes_params)
    params[:votes].each_with_index do |vote_data, index|
      Vote.create!(
        user: current_user,
        event_user_id: vote_data[:event_user_id],
        sort: index
      )
    end


    # @result_total.nil? ? @result_total = {} : ""
    # @result = params.require(:votes).map { |d| d[:event_user_id] }
    # @result.each_with_index do |score_par_event, index|
    #   @result_total[score_par_event].nil? ? @result_total[score_par_event] = index : @result_total[score_par_event] = @result_total[score_par_event] + index
    # end
    # # @result_total = vote_id[@vote.user_id] = @result_total
    # params[:result_total] = @result_total
    # raise
    redirect_to group_path(params[:group_id]), notice: 'A voté !'
  end

  # def score
  #   score_total << params[:votes_result]
  # end

  private

  def votes_params
    params.require(:votes).permit(:user_id, :event_user_id)
  end

# cree vote new et vote save
end
