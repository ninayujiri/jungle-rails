class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:email])
    # If the user exists & the password entered is correct, save a cookie
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to :products
    else
    # If user's login doesn't work, send them back to the login form
      @error = 'Wrong credentials'
      flash[:email] = params[:email]
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_user_path
  end

end