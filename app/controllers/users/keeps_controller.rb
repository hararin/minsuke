class Users::KeepsController < ApplicationController

  before_action :authenticate_user!
  before_action :is_banned
  before_action :set_request

  def create
    @keep = Keep.new(user_id: current_user.id, request_id: @request.id)
    @keep.save
  end

  def destroy
    @keep = Keep.find_by(user_id: current_user.id, request_id: @request.id)
    @keep.destroy
  end

  private

  def set_request
    @request = Request.find(params[:request_id])
  end

end
