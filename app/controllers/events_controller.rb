class EventsController < ApplicationController
  def index
    @events = Event.where(:user_id => params[:user_id])
    @user = User.find(params[:user_id])
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    # @events_by_date = Event.group(&:date)
  end

  def show
    id = params[:id]
    @event = Event.find(id)
  end

  def new
    @event = Event.new
  end

  def create
    event = Event.create(event_params[:event])
    event.user_id = params[:user_id]
    event.save
    redirect_to user_events_path(:user_id => params[:user_id])
  end

  def destroy
    id = params[:id]
    Event.delete(id)
    redirect_to user_events_path(:user_id => params[:user_id])
  end

  def edit
    id = params[:id]
    @event = Event.find(id)
    session[:return_to] = request.referer
  end

  def update
    id = params[:id]
    event = Event.find(id)
    event.update(
    name: event_params[:event][:name],
    description: event_params[:event][:description],
    event_date: event_params[:event][:event_date],
    )
    if session[:return_to].nil?
      redirect_to "/"
    else
      redirect_to session[:return_to]
    end
    session[:return_to] = nil
  end


  private

  def event_params
    params.permit(event:[:name, :description, :event_date, :user_id])
  end
end
