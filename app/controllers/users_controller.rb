class UsersController < ApplicationController
  def index
    @users = user.all
  end

  def show
    id = params[:id]
    @user = user.find(id)
  end

  def new
    @user = user.new
  end

  def create
    user.create(user_params[:user])
    # redirect_to "/people/"
  end

  def delete
    id = params[:id]
    user.delete(id)
    # redirect_to "/people"
  end

  private

  def user_params
    params.permit(user:[:name, :bio, :color])
  end
end
