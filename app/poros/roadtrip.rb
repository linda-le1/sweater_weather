class Roadtrip
    attr_reader :id, :origin, :destination

    def initialize(origin, destination)
        @id = nil
        @origin = origin
        @destination = destination
    end

    def travel_time
        data = google_service(@origin).get_travel_info(@origin, @destination)
        data['routes'][0]['legs'][0]['duration']['text']
    end

    def calculate_time
        trip_duration = self.travel_time
        time_array = trip_duration.split(' ')
        total_hours = time_array[0].to_i
        total_minutes = time_array[3].to_i
        (Time.now + total_hours.hour + total_minutes.minutes).to_i
    end

    def get_coordinates
        @data ||= google_service(@origin).get_travel_info(@origin, @destination)
        @data['routes'][0]['legs'][0]['end_location']
    end

    def arrival_forecast
        time = self.calculate_time
        latitude = self.get_coordinates['lat']
        longitude = self.get_coordinates['lng']
        timezone = Timezone.lookup(latitude, longitude).to_s
        forecast = weather_service(latitude, longitude).get_future_weather(latitude, longitude, time)['currently']
        HourlyWeatherForecast.new(forecast, timezone)
    end

    def google_service(location)
        GoogleService.new(@origin)
    end

    def weather_service(latitude, longitude)
        @service ||= DarkskyService.new(latitude, longitude)
    end
end