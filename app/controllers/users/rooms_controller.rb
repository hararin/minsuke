class Users::RoomsController < ApplicationController

	before_action :authenticate_user!
	before_action :is_banned
  before_action :set_progress_requests
  before_action :set_progress_participants
  before_action :set_keeps

  def show
  	@room = Room.find(params[:id])
    @posts = Post.where(room_id: @room.id)
  	@request = @room.request
  	@participants = @request.participants.all
  	if @request.user != current_user && @participants.where(request_id: @request.id, user_id: current_user.id).empty?
  		redirect_to users_request_path(@request)
  	end
    add_breadcrumb "ホーム", root_path
    add_breadcrumb '依頼一覧', users_requests_path
    add_breadcrumb "依頼詳細", users_request_path(@request)
    add_breadcrumb 'チャット'
  end
end
