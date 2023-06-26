class EventsController < ApplicationController
  before_action :set_event, only: %i[show]

  def show
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end
end
