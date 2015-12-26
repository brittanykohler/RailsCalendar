class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new, :create]
  def new

  end

  def create
  data = params[:session_data]
  @user = User.where(name: data[:name]).first
    if !@user.nil?
      if @user.authenticate(data[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else # if password doesn't match:
        flash.now[:error] = "Incorrect username or password"
        render :new
      end
    else # user is not in the system (name doesn't match any in database):
      flash.now[:error] = "Incorrect username or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
