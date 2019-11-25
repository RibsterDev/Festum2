class VotesController < ApplicationController

  def new
    @group = Group.find(params[:group_id])
  end

  def create

    @result_total.nil? ? @result_total = {} : ""
    @result = params.require(:votes).map { |d| d[:event_user_id] }
    @result.each_with_index do |score_par_event, index|
      @result_total[score_par_event].nil? ? @result_total[score_par_event] = index : @result_total[score_par_event] = @result_total[score_par_event] + index
    end
    params[:result_total] = @result_total
    # rails.raise
    redirect_to groups_path(params[:group_id], @result_total)
  end

  # def score
  #   score_total << params[:votes_result]
  # end


# cree vote new et vote save
end
