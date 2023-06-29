class ChatroomsController < ApplicationController
  before_action :set_event
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end
