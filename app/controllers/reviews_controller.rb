class ReviewsController < ApplicationController
  before_action :set_event, only: %i[new create index]

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.event = @event
    @review.user = current_user
    if @review.save
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
