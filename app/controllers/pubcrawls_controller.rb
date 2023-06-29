class PubcrawlsController < ApplicationController
  before_action :set_pubcrawl, only: %i[show]

  def index
    if params[:location].present?
      @pubcrawls = Pubcrawl.where(location: params[:location])
      @title = "Discover the night in #{params[:location]}"
    else
      @pubcrawls = Pubcrawl.all
      @title = "Discover all our pubcrawls"
    end
    @pubshuffle = @pubcrawls.shuffle
    @markers = @pubcrawls.map do |pubcrawl|
      {
        lat: pubcrawl.first_bar.latitude,
        lng: pubcrawl.first_bar.longitude,
        marker_html: render_to_string(partial: "marker", locals: {pubcrawl: pubcrawl})
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
