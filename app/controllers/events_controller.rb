class EventsController < ApplicationController
  before_action :set_event, only: %i[show]
  before_action :set_pubcrawl, only: [:create]

  def show
    @chatroom = @event.chatroom
    @message = Message.new
    @markers = [@event.pubcrawl.first_bar, @event.pubcrawl.middle_bar, @event.pubcrawl.last_bar].map do |bar|
      {
        lat: bar.latitude,
        lng: bar.longitude,
        marker_html: render_to_string(partial: "marker", locals: {bar: bar}),
        info_window_html: render_to_string(partial: "info_window", locals: {bar: bar})
      }
    end
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
    if event_params[:date] != ""
      if @booking.save
        redirect_to booking_path(@booking)
      else
        render "pubcrawls/show", status: :unprocessable_entity
      end
    else
      render "pubcrawls/show", status: :unprocessable_entity
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
