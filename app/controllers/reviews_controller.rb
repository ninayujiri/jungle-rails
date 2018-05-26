class ReviewsController < ApplicationController

  before_filter :require_login

  def create
    review = current_user.reviews.new(
      rating: review_params[:rating],
      description: review_params[:description],
      product_id: params[:product_id]
    )
    review.save

    if review.save
      redirect_to product_path(review.product), notice: 'Review created'
    else
      redirect_to product_path(review.product)
    end
  end

  def destroy
    @review_id = params[:id]
    @product_id = params[:product_id]

    @review = Review.find(@review_id)
    @review.destroy
    redirect_to product_path(id: @product_id)
  end

  private
    def review_params
      params.require(:review).permit(:rating, :description)
    end

    def require_login
      if !current_user
        flash[:error] = "You must be logged in to review products"
        redirect_to new_user_path
      end
    end

end
