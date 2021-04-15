class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

	def is_banned
		if current_user.is_banned == true
			redirect_to users_user_path(current_user), flash: { error: "このアカウントは停止中のため一部の機能を利用できません。" }
		end
	end

	def set_progress_requests
		@progress_requests = current_user.requests.all.select { |request| request.datetime > DateTime.now }
	end

	def set_progress_participants
		@progress_participants = current_user.participants.all.select { |participant| participant.request.datetime > DateTime.now }
	end

	def any_requests_or_participants?(user)
	    @requests = user.requests.all
	    @req_in_progress = []
	    @participants = user.participants.all
	    @par_in_progress = []
	    @requests.each do |request|
	    	if request.datetime >= DateTime.now
	        	@req_in_progress.push(request)
	    	end
	    end
	    @participants.each do |participant|
	    	if participant.request.datetime >= DateTime.now
	        	@par_in_progress.push(participant)
	    	end
	    end
	end

	def set_keeps
		@keeps = current_user.keeps.all
	end

	def keeps_auto_destroy
		@keeps = current_user.keeps.all
		@keeps.each do |keep|
			if DateTime.now >= keep.request.datetime
				keep.destroy
			end
		end
	end

	protected

	def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	end

end
