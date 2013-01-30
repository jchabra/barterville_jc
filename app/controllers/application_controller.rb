class ApplicationController < ActionController::Base
	protect_from_forgery

	before_filter :authenticate_user
	before_filter :get_open_notifications
	private
	def authenticate_user
	   if session[:id]
	      @authenticated_user = User.find(session[:id])
	   else
	      @authenticated_user = nil
	      # redirect_to login_path
	   end
	end

	def get_open_notifications
		if @authenticated_user
			@open_notifications_count = Notification.where(:open => true).where(:to_user => @authenticated_user.id).count
		end
	end
end
