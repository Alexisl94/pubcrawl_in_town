class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:get_markers]
  before_action :set_event, only: %i[show update]
  before_action :set_pubcrawl, only: [:create]
  before_action :cors_set_access_control_headers, only: [:get_markers]

  def show
    @chatroom = @event.chatroom
    @message = Message.new
    # @time_message = timing(@message)
    bars = [@event.pubcrawl.first_bar, @event.pubcrawl.middle_bar, @event.pubcrawl.last_bar]
    @markers = bars.each_with_index.map do |bar, index|
      {
        lat: bar.latitude,
        lng: bar.longitude,
        status: @event.status,
        marker_html: render_to_string(partial: "marker", locals: {bar: bar, num: index+1}),
        info_window_html: render_to_string(partial: "info_window", locals: {bar: bar, num: index+1})
      }
    end
  end


  def get_markers
    @event = Event.find(params[:event_id])
    # case @event.status
    # when 1
    #   @markers = [@event.pubcrawl.first_bar]
    # when 2
    #   @markers = [@event.pubcrawl.first_bar, @event.pubcrawl.middle_bar]
    # when 3
    #   @markers = [@event.pubcrawl.first_bar, @event.pubcrawl.middle_bar, @event.pubcrawl.last_bar]
    # end

    @markers = @markers.each_with_index.map do |bar, index|
      {
        lat: bar.latitude,
        lng: bar.longitude,
        status: @event.status,
        marker_html: render_to_string(partial: "marker", locals: {bar: bar, num: index+1}),
        info_window_html: render_to_string(partial: "info_window", locals: {bar: bar, num: index+1})
      }
    end
    # render json: @markers
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
    @booking.people = params[:people]
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

  def update
    if @event.status < 3
      @event.status += 1
      @event.save
    end
  end

  # def timing(message)
  #   now = Time.now
  #   date_message = Time.parse(message.created_at)
  #   diff = now - date_message

  #   if diff < 3600
  #     minutes = (diff / 60).to_i
  #     result = "#{minutes} minutes ago"
  #   elsif diff < 86400
  #     hours = (diff / 3600).to_i
  #     result = "#{hours} hours ago"
  #   else
  #     result = date_message.strftime("%a %b %e at %l:%M")
  #   end

  #   @time_message = result
  # end


  private

  def cors_set_access_control_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'GET'
      headers['Access-Control-Request-Method'] = '*'
      headers["Access-Control-Allow-Credentials"] = false
      headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end

  def event_params
    params.require(:event).permit(:date, :status, :people)
  end

  def set_pubcrawl
    @pubcrawl = Pubcrawl.find(params[:pubcrawl_id])
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
