class Users::AnotherEvaluationsController < ApplicationController

  before_action :authenticate_user!
  before_action :is_banned
  before_action :set_progress_requests
  before_action :set_progress_participants
  before_action :set_keeps
  before_action :keeps_auto_destroy

  def index
    @user = User.find(params[:user_id])
    @requests = @user.requests.all
    @another_evaluations = []
    @requests.each do |request|
      @another_evaluations << AnotherEvaluation.where(request_id: request.id)
    end
    @evaluations = []
    @another_evaluations.each do |evaluation|
      @evaluations << evaluation
    end
  end

  def new
    @evaluation = AnotherEvaluation.new
    @request = Request.find(params[:request_id])
    @participants = @request.participants.all
    redirect_to users_request_path(@request) if not @participants.exists?(user_id: current_user.id)
  end

  def create
    @request = Request.find(params[:request_id])
    @evaluation = current_user.another_evaluations.new(another_evaluation_params)
    @evaluation.request_id = @request.id
    if @evaluation.save
      redirect_to users_request_path(@request), flash: { notice: "#{@request.user.name}さんを評価しました。" }
    else
      render :new
    end
  end

  private
  def another_evaluation_params
    params.require(:another_evaluation).permit(:evaluation, :content)
  end

end
