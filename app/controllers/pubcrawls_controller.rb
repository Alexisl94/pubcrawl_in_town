class PubcrawlsController < ApplicationController
  before_action :set_pubcrawl, only: %i[show]

  def index
    @pubcrawls = Pubcrawl.all
    @markers = @pubcrawls.map do |pubcrawl|
      {
        lat: pubcrawl.first_bar.latitude,
        lng: pubcrawl.first_bar.longitude
      }
    end
  end

  def show
    @event = Event.new
  end

  private

  def set_pubcrawl
    @pubcrawl = Pubcrawl.find(params[:id])
  end
end
