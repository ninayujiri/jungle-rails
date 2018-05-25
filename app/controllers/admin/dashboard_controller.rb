class Admin::DashboardController < ApplicationController

  before_action :authenticate

  def show
  end

  private

  def authenticate
    authenticate_or_request_with_http_basic do |user, password|
      user == ENV['ADMIN_USERNAME'] && password == ENV['ADMIN_PASS']
    end
  end
end
