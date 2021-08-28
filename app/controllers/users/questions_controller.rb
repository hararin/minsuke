class Users::QuestionsController < ApplicationController

  before_action :authenticate_user!
  before_action :is_banned
  before_action :set_progress_requests
  before_action :set_progress_participants
  before_action :set_keeps
  before_action :keeps_auto_destroy

  def new
    @question = Question.new
    @request = Request.find(params[:request_id])
  end

  def create
    @request = Request.find(params[:request_id])
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    @question.request_id = @request.id
    if @question.save
      redirect_to users_request_path(@request), flash: { notice: "質問しました。" }
    else
      render :new
    end
  end

  def edit
    @request = Request.find(params[:request_id])
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @request = Request.find(params[:request_id])
    if @question.update(question_params)
      @question.update(status: 2)
      redirect_to users_request_path(@request)
    else
      render :edit
    end
  end

  def solved
    @request = Request.find(params[:request_id])
    @question = Question.find(params[:id])
    if @question.user != current_user
      redirect_to users_request_path(@request)
    else
      if @question.update(status: 3)
        redirect_to users_request_path(@request)
      end
    end
  end

  def destroy
    
  end

  def question_params
    params.require(:question).permit(:content)
  end

end
