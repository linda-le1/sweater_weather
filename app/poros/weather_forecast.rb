class WeatherForecast
    attr_reader :id, :location

    def initialize(location)
        @id = nil
        @location = location
    end

    def weekly_forecast_results
        results = weather_service(location_results.latitude, location_results.longitude).get_daily_weather
        results.map do |info|
            WeeklyWeatherForecast.new(info, location_results.timezone)
        end
    end

    def all_hourly_results
        results = weather_service(location_results.latitude, location_results.longitude).get_hourly_weather
        results.map do |info|
            HourlyWeatherForecast.new(info, location_results.timezone)
        end
    end

    def hourly_forecast_results
        all_hourly_results.first(8)
    end

    def current_weather_results
        weather = {}
        results = weather_service(location_results.latitude, location_results.longitude).get_summary_weather
        weather['current_forecast'] = CurrentWeatherForecast.new(results, location_results.timezone)
        weather['current_evening_forecast'] = self.current_evening_results
        weather
    end

    def current_evening_results
        all_hourly_results.collect do |result|
            return result.summary if result.time.hour == 21
            end
    end

    def location_results
        @results ||= google_service(location).get_json_coordinates
        Location.new(@results)
    end

    def weather_service(latitude, longitude)
        DarkskyService.new(latitude, longitude)
    end

    def google_service(location)
        GoogleService.new(@location)
    end

end
