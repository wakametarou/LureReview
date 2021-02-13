class ReviewsController < ApplicationController
  def index
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to lure_reviews_path(@review.lure)
    else
      @lure = Lure.find(params[:lure_id])
      render "lures/show"
    end
  end

  private
  def review_params
    params.require(:review).permit(:lure_id, :score, :content)
  end
end
