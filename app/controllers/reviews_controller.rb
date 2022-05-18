class ReviewsController < ApplicationController
  def new
    # We need @restaurant in our `simple_form_for`
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    @review.save!
    redirect_to restaurant_path(@review.restaurant)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant), status: :see_other
  end

    private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
