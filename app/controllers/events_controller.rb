class EventsController < ApplicationController
  def index
  @events = event.all
end

def show
  id = params[:id]
  @event = event.find(id)
end

def new
  @event = event.new
end

def create
  event.create(event_params[:event])
end

def destroy
  id = params[:id]
  event.delete(id)
  redirect_to "/"
end

def edit
  id = params[:id]
  @event = event.find(id)
end

def update
  id = params[:id]
  event = event.find(id)
  event.update(
  name: event_params[:event][:name],
  description: event_params[:event][:description],
  event_date: event_params[:event][:event_date],
  user_id: event_params[:event][:user_id]
  )
  redirect_to "/"
end


private

def event_params
  params.permit(event:[:name, :description, :event_date, :user_id])
end
end
