require "date"

class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy, :update]
  before_action :set_event, only: [:new, :create]


  def index
    @bookings = Booking.all
  end

  def show
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.event = @event
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render "events/show"
    end
  end

  def update
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_trip
    @event = Event.find(params[:event_id])
  end
end
