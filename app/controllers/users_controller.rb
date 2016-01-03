class UsersController < ApplicationController
before_action :require_user, only: [:show, :edit, :update, :destroy]
before_action :redirect_if_logged_in, only:[:new, :create]

  def index
    # I am not sure if you need the @users instance variable, because you don't actually list all users on the index page
    # @users = User.all
  end

  def show
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
    @user = @current_user
    session[:return_to] = request.referer
  end

  def update
    id = params[:id]
    @user = User.find(id)
    if @user.id != @current_user.id
      flash[:error] = "You cannot edit another user's info!"
      redirect_to edit_user_path(@current_user)
    else
      @user.update(user_params[:user])
      if @user.save
        if session[:return_to].nil?
          redirect_to "/"
        else
          redirect_to session[:return_to]
        end
      else
        render "edit"
      end
    end
    session[:return_to] = nil
  end

  def destroy
    id = params[:id].to_i
    User.delete(id) if id == @current_user.id
    redirect_to "/"
  end

  private

  def user_params
    params.permit(user:[:name, :bio, :password, :password_confirmation])
  end
end
