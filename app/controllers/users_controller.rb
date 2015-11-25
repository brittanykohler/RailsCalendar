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
    # redirect_to "/people/"
  end

  def delete
    id = params[:id]
    User.delete(id)
    # redirect_to "/people"
  end

  private

  def user_params
    params.permit(user:[:name, :bio, :color])
  end
end
