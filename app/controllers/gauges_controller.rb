class GaugesController < ApplicationController
    before_action :set_power_gauge, only: [:show]

    def index
      if current_user.is_manager?
        @power_gauges = PowerGauge.all
      else
        @power_gauges = current_user.power_gauges.all
      end
    end

    def new
      @gauge = PowerGauge.new
    end

    def show
      @measurement = @power_gauge.measurements 
    end    

    def create
      @gauge = current_user.power_gauges.new(gauge_params)
      if @gauge.save
        redirect_to new_gauge_measurement_path(@gauge)
      else
        render :new
      end
    end
  
    
    private
  
    def gauge_params
      params.require(:power_gauge).permit(:name, :start_date, :end_date, :unit, :time_unit)
    end

    def set_power_gauge
      if current_user.is_manager?
        @power_gauge = PowerGauge.find(params[:id])
      else
        @power_gauge = current_user.power_gauges.find(params[:id])
      end
    end

end