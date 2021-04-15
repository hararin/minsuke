class Users::PurchasesController < ApplicationController

	before_action :authenticate_user!
	before_action :is_banned, only: :create
  before_action :set_progress_requests
  before_action :set_progress_participants
  before_action :set_keeps

	def index
		@purchases = current_user.purchases.page(params[:page]).per(10).recent
	end

	def new
		@tickets = Ticket.all
		@purchase = Purchase.new
		add_breadcrumb "ホーム" , root_path
		add_breadcrumb 'マイページ', users_user_path(current_user)
		add_breadcrumb 'チケット購入'
	end

	def create
		if params[:purchase][:ticket_id] == "" || params[:purchase][:quantity] == ""
			redirect_to new_users_purchase_path, flash: { error: "購入内容を入力してください。" }
		else
			@user = current_user
			@purchase = @user.purchases.new(purchase_params)
			@ticket = Ticket.find_by(id: params[:purchase][:ticket_id])
			@purchase.charge = @ticket.price * params[:purchase][:quantity].to_i
			@user.update(ticket: @user.ticket + @ticket.quantity * params[:purchase][:quantity].to_i)
			if @purchase.save
				redirect_to users_user_path(current_user), flash: { notice: "チケットが#{@ticket.quantity * params[:purchase][:quantity].to_i}枚追加されました。" }
			else
				render :new
			end
		end
	end

	private

	def purchase_params
		params.require(:purchase).permit(:ticket_id, :payment_method, :quantity)
	end

end
