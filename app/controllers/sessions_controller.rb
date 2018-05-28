class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.authenticate_with_credentials(params[:email], params[:password])

    if @user
      session[:user_id] = @user.id
      redirect_to :products
    else
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