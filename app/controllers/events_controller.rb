class EventsController < ApplicationController
  before_action :set_event, only: %i[show]
  before_action :set_pubcrawl, only: [:create]

  def show
    @chatroom = @event.chatroom
    @message = Message.new
    # @time_message = timing(@message)
    respond_to do |format|
      format.html
      format.json # Follows the classic Rails flow and look for a create.json view
    end
  end


  def get_markers
    @event = Event.find(params[:event_id])
    case @event.status
    when 1
      @markers = [@event.pubcrawl.first_bar]
    when 2
      @markers = [@event.pubcrawl.first_bar, @event.pubcrawl.middle_bar]
    when 3
      @markers = [@event.pubcrawl.first_bar, @event.pubcrawl.middle_bar, @event.pubcrawl.last_bar]
    end

    @markers = @markers.each_with_index.map do |bar, index|
      {
        lat: bar.latitude,
        lng: bar.longitude,
        status: @event.status,
        marker_html: render_to_string(partial: "marker", locals: {bar: bar, num: index+1}),
        info_window_html: render_to_string(partial: "info_window", locals: {bar: bar, num: index+1})
      }
    end
    # respond_to do |format|
    #   format.html { redirect_to event_path(@event) }
    #   format.json { render partial "events/get_markers"}
    # end
    render json: @markers
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

  def check_notification_message
    current_time = Time.current
    messages = []

    if current_time.hour == 15 && current_time.min >= 30
      messages.push("<li class='notification'>The event is about to begin, go to the first bar!</li>")
    end

    if current_time.hour == 15 && current_time.min >= 31
      messages.push("<li class='notification'>10pm, time to move to the second bar!</li>")
    end

    if current_time.hour == 15 && current_time.min >= 32
      messages.push("<li class='notification'>It's now 11 p.m., so make your way to the third and final bar!</li>")
    end

    render plain: "<ul>#{messages.join}</ul>"
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
