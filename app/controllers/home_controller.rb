class HomeController < ApplicationController
  def index
    redirect_to gauges_path if current_user
  end
end