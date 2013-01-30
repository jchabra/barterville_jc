class UsersController < ApplicationController
	def index
		@users = User.all

		@notifications = Notification.all
		@top_users = {}
		@notifications.each do |notification|
			if !@top_users[notification.to_user].present?
				@top_users[notification.to_user] = 1
			else
				@top_users[notification.to_user] += 1
			end

			if !@top_users[notification.from_user].present?
				@top_users[notification.from_user] = 1
			else
				@top_users[notification.from_user] += 1
			end
		end
		@top_users = @top_users.sort_by{|k,v| -v}.first 3
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
	    if @user.save
	    	session[:username] = @user.username
			session[:id] = @user[:id]
			Mailings.welcome(@user.username).deliver #sends user a welcome email when they sign up
	    	redirect_to new_product_path
	    else
	    	render :new
	    end
	end

	def show
		user_id = params[:id]
		@user = User.find(user_id)
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
    	redirect_to user_path
    else
      render :edit
    end
	end

	def edit
		@user = User.find(params[:id].to_i)
		if session[:id] != params[:id].to_i
			redirect_to users_path
		end
	end

	def destroy
		if session[:id] != params[:id].to_i
			redirect_to users_path
		else
			user = User.find(params[:id])
    	reset_session #Bad things happen if you don't reset the session.
    	user.delete
    	redirect_to users_path
		end
	end
end