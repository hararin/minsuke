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
    
  end

  def update
    
  end

  def destroy
    
  end

  def question_params
    params.require(:question).permit(:content)
  end

end
