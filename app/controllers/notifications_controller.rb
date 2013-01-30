class NotificationsController < ApplicationController
	def index
		@to_notifications = Notification.where(:to_user => @authenticated_user.id)
		@from_notifications = Notification.where(:from_user => @authenticated_user.id)
	end
	def create
		from_product = params[:proposed_trade]
		from_user = session[:id]
		to_product = params[:product]
		@to_user_id = params[:owner]
		@notification = Notification.create(:from_product => from_product, :to_product => to_product, :from_user => from_user, :to_user => @to_user_id)
		@to_user = User.find(@to_user_id)
		Mailings.trade_proposed(@to_user).deliver
		redirect_to notifications_path
	end

	def accept_trade
		notification = Notification.find(params[:notification_id])
		notification.update_attributes(:open => false)
		from_product = Product.find(notification.from_product)
		@from_user = User.find(notification.from_user)
		to_product = Product.find(notification.to_product)
		to_user = User.find(notification.to_user)
		
		from_product.update_attributes(:user_id => to_user.id)
		to_product.update_attributes(:user_id => @from_user.id)

		Mailings.trade_accepted(@from_user).deliver 
		redirect_to notifications_path
	end

	def reject_trade
		notification = Notification.find(params[:notification_id])
		notification.update_attributes(:open => false)
		
		redirect_to notifications_path
	end

end