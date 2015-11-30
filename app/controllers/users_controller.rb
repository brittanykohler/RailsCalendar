class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    id = params[:id]
    @user = User.find(id)
  end

  def new
    @user = User.new
  end

  def create
    User.create(user_params[:user])
    redirect_to "/"
  end

  def edit
    id = params[:id]
    @user = User.find(id)
    session[:return_to] = request.referer
  end

  def update
    id = params[:id]
    user = User.find(id)
    user.update(
    name: user_params[:user][:name],
    bio: user_params[:user][:bio],
    )
    if session[:return_to].nil?
      redirect_to "/"
    else
      redirect_to session[:return_to]
    end
    session[:return_to] = nil
  end

  def destroy
    id = params[:id]
    User.delete(id)
    redirect_to "/"
  end

  private

  def user_params
    params.permit(user:[:name, :bio])
  end
end
