class ReviewsController < ApplicationController
  def create
    review = current_user.reviews.new(
      rating: review_params[:rating],
      description: review_params[:description],
      product_id: params[:product_id]
    )
    review.save

    if review.save
      redirect_to product_path(review.product)
    else
      render product_path
    end
  end

  private
    def review_params
      params.require(:review).permit(:rating, :description)
    end
end
