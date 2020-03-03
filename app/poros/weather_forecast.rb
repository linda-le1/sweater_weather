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
        forecast_results['daily']['data'].flat_map do |info|
            weekly_weather_collection << WeeklyWeatherForecast.new(info, location_results.timezone)
        end
        weekly_weather_collection.first(5)
    end

    def all_hourly_results
        hourly_weather_collection = []
        forecast_results['hourly']['data'].flat_map do |info|
            hourly_weather_collection << HourlyWeatherForecast.new(info, location_results.timezone)
        end
    end

    def hourly_forecast_results
        all_hourly_results.first(8)
    end

    def current_weather_results
        CurrentWeatherForecast.new(forecast_results, location_results.timezone)
    end

    def current_evening_summary
        all_hourly_results.collect do |result|
            return result.summary if result.time.hour == 21
            end
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
