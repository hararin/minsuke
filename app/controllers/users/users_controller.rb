class Users::UsersController < ApplicationController

	before_action :authenticate_user!
	before_action :is_banned, only:[:edit, :update]
	before_action :set_progress_requests
	before_action :set_progress_participants
	before_action :set_keeps
	before_action :keeps_auto_destroy

	def show
		@user = User.find(params[:id])
		set_evaluation
		set_another_evaluation
		@requests = current_user.requests.all
		@requests.each do |request|
			request.ticket_return(request)
		end
		add_breadcrumb "ホーム" , root_path
		add_breadcrumb "ユーザー詳細" , users_user_path(@user)
	end

	def edit
		@user = current_user
		add_breadcrumb "ホーム" , root_path
		add_breadcrumb 'マイページ', users_user_path(current_user)
		add_breadcrumb 'ユーザー編集'
	end

	def update
		@user = current_user
		if @user.update(user_params)
			redirect_to users_user_path(current_user)
		else
			render :edit
		end
	end

	def withdraw
		@user = current_user
		any_requests_or_participants?(@user)
		if @req_in_progress.blank? == false
	    	redirect_to users_user_path(@user), flash: { error: "進行中の依頼があるため退会できません。" }
	    	return
	    elsif @par_in_progress.blank? == false
	    	redirect_to users_user_path(@user), flash: { error: "進行中の助っ人があるため退会できません。" }
	    	return
	    else
		    @user.discard
			reset_session
			redirect_to '/'
	    end
	end

	private

	def user_params
		params.require(:user).permit(:name, :image, :introduction)
	end

end
