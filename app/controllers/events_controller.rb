class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    latest_id = params[:latest_id]
    if @event
      latest_id = latest_id ? latest_id : -1
      event_images =  ActiveRecord::Base.connection.execute("select * from twitters where hashtag='#{@event.hashtag}' and id>#{latest_id} order by twitters.created_at DESC")
      @event["latest_id"] = latest_id

      if event_images
        event_images.each { |image| image.delete("image") }
        @event["images"] = event_images
      else
        @event["images"] = nil
      end
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
