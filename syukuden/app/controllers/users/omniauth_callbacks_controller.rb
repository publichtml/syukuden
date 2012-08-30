class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

	def twitter
		@user = User.find_or_create_by_twitter_auth(omniauth_info)
		sign_in @user
		redirect_to root_path
	end

	def facebook
		@user = User.find_or_create_by_facebook_auth(omniauth_info)
		sign_in @user
		redirect_to root_path
	end

	private

	def omniauth_info
		request.env["omniauth.auth"]
	end
end