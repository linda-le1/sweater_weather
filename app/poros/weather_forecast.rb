class WeatherForecast
    attr_reader :id, :location

    def initialize(location)
        @id = nil
        @location = location
    end

    def forecast_results
        weather_service(location_results.latitude, location_results.longitude).get_json_weather
    end

    def daily_forecast_results
        weekly_weather_collection =[]
        self.forecast_results['daily']['data'].first(5).flat_map do |info|
            weekly_weather_collection << WeeklyWeatherForecast.new(info)
        end
        weekly_weather_collection
    end

    def hourly_forecast_results
        hourly_weather_collection = []
        self.forecast_results['hourly']['data'].first(8).flat_map do |info|
            hourly_weather_collection << HourlyWeatherForecast.new(info)
        end
        hourly_weather_collection
    end

    def current_weather_results
        CurrentWeatherForecast.new(forecast_results)
    end

    def location_results
        results =google_service(location).get_json_coordinates
        Location.new(results)
    end

    def weather_service(latitude, longitude)
        DarkskyService.new(location_results.latitude, location_results.longitude)
    end

    def google_service(location)
        GoogleService.new(@location)
    end

end
