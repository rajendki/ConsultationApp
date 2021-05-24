class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def fetchrole
		puts params[:role]
		@users = User.where("role = ?", params[:role]);
		render json: @users
	end

	def must_be_admin
		unless current_user.admin?
		  redirect_to meetings_path, alert: 'you dont have access to this page'
		end
	end
end