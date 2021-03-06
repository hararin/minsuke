class Users::ParticipantsController < ApplicationController

	before_action :authenticate_user!
	before_action :is_banned

	def create
		@request = Request.find_by(id: params[:request_id])
		@room = Room.find_by(request_id: @request.id)
		@participant = @request.participants.new
		@participant.user_id = current_user.id
		if @request.capacity > @request.participants.count
			if @participant.save
				current_user.update(ticket: current_user.ticket + 1)
				current_user.user_rooms.create(room_id: @room.id)
			else
			end
		else
			redirect_to users_request_path(@request), flash: { error: "定員に達しています" }
		end
		redirect_to users_request_path(@request)
	end

	def destroy
		@participant = Participant.find_by(request_id: params[:request_id],
										   id: params[:id])
		@room = @participant.request.room
		@user_room = UserRoom.find_by(user_id: current_user.id, room_id: @room.id)
		if @participant.user.ticket >= 1
			@user_room.destroy
			@participant.destroy
			current_user.update(ticket: current_user.ticket - 1)
		else
			redirect_to users_request_path(@participant.request), flash: { error: "キャンセル用のチケットが不足しています" }
		end
		redirect_to users_request_path(@participant.request)
	end

end
