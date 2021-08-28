class Users::AnswersController < ApplicationController

  before_action :authenticate_user!
  before_action :is_banned
  before_action :set_progress_requests
  before_action :set_progress_participants
  before_action :set_keeps
  before_action :keeps_auto_destroy

  def new
    @request = Request.find(params[:request_id])
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  def create
    @answer = Answer.new(answer_params)
    @question = Question.find(params[:question_id])
    @request = Request.find(params[:request_id])
    @answer.user_id = current_user.id
    @answer.question_id = @question.id
    if @answer.save
      @question.update(status: 1)
      redirect_to users_request_path(@request)
    else
      render :new
    end
  end

  def edit
    @answer = Answer.find(params[:id])
    @question = @answer.question
    @request = @answer.question.request
  end

  def update
    @answer = Answer.find(params[:id])
    @question = @answer.question
    @request = @answer.question.request
    if @answer.update(answer_params)
      @question.update(status: 1)
      redirect_to users_request_path(@request)
    else
      render :edit
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:content)
  end

end
