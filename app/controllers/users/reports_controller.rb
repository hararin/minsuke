class Users::ReportsController < ApplicationController

	before_action :authenticate_user!
	before_action :is_banned
  before_action :set_progress_requests
  before_action :set_progress_participants

	def new
		@report = Report.new
		@respondent = User.find(params[:user_id])
		add_breadcrumb "ホーム" , root_path
		add_breadcrumb "マイページ" , users_user_path(current_user)
		add_breadcrumb "ユーザー詳細" , users_user_path(@respondent)
		add_breadcrumb "通報"
	end

	def create
		@respondent = User.find(params[:user_id])
		@report = Report.new(report_params)
		@report.user_id = current_user.id
		@report.respondent_id = @respondent.id
		if @report.save
			redirect_to users_user_path(@respondent), flash: { notice: "#{@respondent.name}さんを通報しました。" }
		else
			render :new
		end
	end

	private

	def report_params
		params.require(:report).permit(:respondent_id, :content)
	end

end
