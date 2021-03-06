class Users::RequestHistoriesController < ApplicationController

  before_action :authenticate_user!
  before_action :is_banned
  before_action :keeps_auto_destroy

  def index
    @user = User.find(params[:user_id])
    @requests = @user.requests.page(params[:page]).per(10).recent
  end

end
