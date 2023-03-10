class UsersController < ApplicationController
	before_action :find_user_by_id, only: [:show, :edit, :update, :destroy]

	def new
		@user = User.new
	end

	def create
		@user =User.new(user_params)
		if @user.save
			flash[:notice] = "Welcome to Alpha Blog #{@user.username}"
			redirect_to articles_path
		else
			render 'new'
		end
	end

	def edit

	end

	def update
		if @user.update(user_params)
			flash[:notice] = "Your account was successfully updated."
			redirect_to articles_path
		else
			render 'edit'
		end
	end


	private

	def find_user_by_id
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:username,  :email, :password)
	end
end