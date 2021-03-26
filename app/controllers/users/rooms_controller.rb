class Users::RoomsController < ApplicationController

	before_action :authenticate_user!, except: :index
	before_action :is_banned, except: [:index, :show]

  def show
  	@room = Room.find(params[:id])
    @posts = Post.where(room_id: @room.id)
  	@request = @room.request
  	@participants = @request.participants.all
  	if @request.user != current_user && @participants.where(request_id: @request.id, user_id: current_user.id).empty?
  		redirect_to users_request_path(@request)
  	end
  end
end
