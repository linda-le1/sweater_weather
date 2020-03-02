class Api::V1::WeatherController < ApplicationController

    def index
        forecast_results = WeatherForecastFacade.new(params[:location])
        render json: WeatherForecastSerializer.new(forecast_results)
    end

end
