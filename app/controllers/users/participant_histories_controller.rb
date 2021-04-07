class Users::ParticipantHistoriesController < ApplicationController

  before_action :authenticate_user!
  before_action :is_banned

  def index
    @user = User.find(params[:user_id])
    @participants = @user.participants.page(params[:page]).per(10)
  end

end
