# app/controllers/reviews_controller.rb
class ReviewsController < ApplicationController
    load_and_authorize_resource
    before_action :set_power_gauge, :set_measurement

    def new
      @review = @measurement.build_review
    end
  
    def create
      @review = @measurement.build_review(review_params)
      @review.user = current_user
      
      if @review.save
        redirect_to gauge_measurements_path
      else
        render 'new'
      end
    end
  
    private
  
    def set_power_gauge
      @power_gauge = PowerGauge.find(params[:gauge_id])
    end

    def set_measurement
      @measurement = Measurement.find(params[:measurement_id])
    end
  
    def review_params
      params.require(:review).permit(:status)
    end

  end