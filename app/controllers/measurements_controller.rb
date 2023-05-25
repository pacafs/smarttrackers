class MeasurementsController < ApplicationController
    before_action :set_power_gauge
    before_action :set_measurement, only: :show

    def index
      @measurements = @gauge.measurements.all
    end

    def new
      @measurement = @gauge.measurements.new
    end

    def show
    end
  
    def create
      @measurement = @gauge.measurements.new(measurement_params)
      if @measurement.save
        redirect_to new_gauge_url
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