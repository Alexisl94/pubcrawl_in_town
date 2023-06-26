class PubcrawlsController < ApplicationController
  before_action :set_pubcrawl, only: %i[show]

  def index
    @pubcrawls = Pubcrawl.all
  end

  def show
    #@event = Event.find(pubcrawl_id + date)
    @booking = Booking.new
  end

  private

  def set_pubcrawl
    @pubcrawl = Pubcrawl.find(params[:id])
  end
end
