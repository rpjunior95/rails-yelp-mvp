class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to restautant_path(@review)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
