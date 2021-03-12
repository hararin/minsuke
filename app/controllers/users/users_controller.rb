class Users::UsersController < ApplicationController

	before_action :authenticate_user!

	def show
		@user = User.find(params[:id])
		@requests = @user.requests.page(params[:page]).per(5)
		@requests.each do |request|
			request.ticket_return(request)
		end
	end

	def edit
		@user = current_user
	end

	def update
		@user = current_user
		if @user.update(user_params)
			redirect_to users_customer_path(current_user)
		else
			render :edit
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :image, :introduction)
	end

end
