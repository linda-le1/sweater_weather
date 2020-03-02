class WeatherForecastFacade
    attr_reader :id, :location

    def initialize(location)
        @id = nil
        @location = location
    end

    def forecast_results
        service = WeatherService.new(@location)
        service.get_weather
    end

    def daily_forecast_results
        weekly_weather_collection =[]
        self.forecast_results['daily']['data'].first(5).flat_map do |info|
            weekly_weather_collection << WeeklyWeatherForecast.new(info)
        end
    end

    def hourly_forecast_results
        hourly_weather_collection = []
        self.forecast_results['hourly']['data'].first(8).flat_map do |info|
            hourly_weather_collection << HourlyWeatherForecast.new(info)
        end
    end

    def current_weather_results
        CurrentWeatherForecast.new(forecast_results)
    end

end
