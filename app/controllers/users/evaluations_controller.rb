class Users::EvaluationsController < ApplicationController

  before_action :authenticate_user!
  before_action :is_banned
  before_action :set_progress_requests
  before_action :set_progress_participants
  before_action :set_keeps
  before_action :keeps_auto_destroy

  def new
    @evaluation = Evaluation.new
    @participant = Participant.find(params[:participant_id])
    redirect_to users_request_path(@participant.request) if @participant.request.user != current_user
  end

  def create
    @participant = Participant.find(params[:participant_id])
    @evaluation = current_user.evaluations.new(evaluation_params)
    @evaluation.participant_id = @participant.id
    if @evaluation.save
      redirect_to users_request_path(@participant.request), flash: { notice: "#{@participant.user.name}さんを評価しました。" }
    else
      render :new
    end
  end

  private
  def evaluation_params
    params.require(:evaluation).permit(:evaluation, :content)
  end
end
