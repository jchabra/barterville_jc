module ApplicationHelper
	def login_or_logout_link
		if @authenticated_user
			link_to "Logout", logout_path
		else
			link_to "Login", login_path
		end
	end

	def notification_link
		if @authenticated_user
			link_to "Your Trades (#{@open_notifications_count})", notifications_path
		else
			# link_to "Sign Up", new_user_path
		end
	end

	#Product Helper

	def all_products_content
		if @authenticated_user
			render 'all_products'
			link_to 'Add New Product', new_product_path
		else
			link_to "Please Log In To See Your Products", login_path
		end
	end

	def trade_options
		if !@authenticated_user.nil? && @product_owner != @authenticated_user
			render :partial => 'trading', :locals => {:product => @product}
		end
	end

	#User helpers

	def edit_or_from_link
		if @product_owner == @authenticated_user
			link_to "You (Edit Product)", edit_product_path(@product) 
		else
			link_to @product_owner.username, @product_owner
		end
	end

	def edit_profile_link #if the profile pg you're on is your page, then go ahead and edit it.
		if @authenticated_user == @user
			link_to "Edit Profile", edit_user_path(@user)
		else
			#this does nothing
		end
	end

	#Notification helpers

	def open_status
		if notification.open
			"open"
		else
			"closed"
		end	
	end

	#Username on nav bar helper

	def user_nav_link
		if @authenticated_user
			link_to @authenticated_user.username, @authenticated_user
		else
			#do nothing
		end
	end
end
