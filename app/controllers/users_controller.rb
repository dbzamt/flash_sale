class UsersController < ApplicationController

  before_action :set_current_user, only: [:show]
  before_action :log_out, only: [:logout]

  def show
    debugger    
    render json: current_user,status: :ok
    
  end

  def logout
    flash[:success] = "Successfully signed out"
    redirect_to root_url
  end
end
