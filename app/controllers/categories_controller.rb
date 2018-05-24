class CategoriesController < ApplicationController

  # to force users to login before viewing a page
  # before_filter :authorize

  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
  end

end
