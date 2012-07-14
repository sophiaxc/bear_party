class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    if @event
      render :json => @event.to_json
    else
      render :json => { :errors => "No such event!" }, :status => 422
    end
  end

  def create
    @event = Event.new(name: params[:name], hashtag: params[:hashtag])
    if @event.save
      render :json => @event.to_json
    else
      render :json => { :errors => @event.errors.full_messages }, :status => 422
    end
  end
end
