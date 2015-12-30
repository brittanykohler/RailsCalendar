class UsersController < ApplicationController
  def index
    # I am not sure if you need the @users instance variable, because you don't actually list all users on the index page
    # @users = User.all
  end

  def show
    id = params[:id]
    @user = User.find(id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params[:user])
    if @user.save
    # makes it so they don't have to login after they sign up. Takes the session data so it can run the redirect.
    session[:user_id] = @user.id
    redirect_to user_path(@user)
    else
      flash[:error] = "Try again. Or you may already be a user. Try logging in."
      render :new
    end
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
    params.permit(user:[:name, :bio, :password, :password_confirmation])
  end
end
