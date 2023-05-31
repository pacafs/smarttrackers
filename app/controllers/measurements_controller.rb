class MeasurementsController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
    before_action :set_power_gauge
    before_action :set_measurement, only: [:show, :edit, :update]

    def index
      @measurements = @gauge.measurements.all
    end

    def new
      @measurement = @gauge.measurements.new
    end

    def show  
    end

    def edit
      if @measurement.review
        redirect_to gauge_url(@gauge) if @measurement.review.status == "Approved"
      else  
        redirect_to gauge_url(@gauge)
      end
    end

    def update
      if @measurement.update(measurement_params)
        @measurement.review.update(status: "Pending")
        redirect_to gauge_url(@gauge)
      else
        render :edit
      end
    end

    def create
      @measurement = @gauge.measurements.create(measurement_params)
      if @measurement.save
        redirect_to gauge_url(@gauge)
      else
        render :new
      end
    end
  
    
    
    private
  
    def measurement_params
      params.require(:measurement).permit(:amount)
    end

    def set_power_gauge
      @gauge = PowerGauge.find(params[:gauge_id])
    end

    def set_measurement
      @measurement = Measurement.find(params[:id])
    end
    
  
  end