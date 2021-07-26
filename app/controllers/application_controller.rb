class ApplicationController < ActionController::Base

	protect_from_forgery with: :exception

	def log_in(user)
		cookies[:user_id] = user.id
	end

	def current_user
		if cookies[:user_id]
		  @current_user ||= User.find_by(id: cookies[:user_id])
		end
	end

	def logged_in?
		!current_user.nil?
	end

	def log_out
		cookies.delete(:user_id)
		@current_user = nil
	end

	def destroy
		log_out
		flash[:danger] = "Enter a valid user id."
	end

	def set_current_user
		user = User.find_by_id(params[:id])
		if user
		  log_in(user)
		else
		  destroy
		end
	end


	def authenticate_user
		unless logged_in?
		  redirect_to root_url and return
		end
	end


end
