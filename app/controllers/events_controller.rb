class EventsController < ApplicationController
  before_action :set_event, only: %i[show]
  before_action :set_pubcrawl, only: [:create]

  def show
    @chatroom = @event.chatroom
    @message = Message.new
  end

  def create
    @event = Event.find_or_create_by(pubcrawl: @pubcrawl, date: event_params[:date])
    if @event.chatroom.nil?
      @chatroom = Chatroom.create!(name: "#{@event.pubcrawl.name}_#{@event.date}")
      @event.chatroom = @chatroom
      @event.save
    end
    @booking = Booking.new
    @booking.event = @event
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render "pubcrawls/show"
    end
  end

  private

  def event_params
    params.require(:event).permit(:date)
  end

  def set_pubcrawl
    @pubcrawl = Pubcrawl.find(params[:pubcrawl_id])
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
