class MunchiesFacade

    attr_reader :start, :destination, :id

    def initialize(start, destination, cuisine)
        @id = nil
        @start = start.gsub(",", "+")
        @destination = destination.gsub(",", "+")
        @cuisine = cuisine
    end

    def end_location
        start_google_service(@start, @destination).get_end_location
    end

    def travel_time
        start_google_service(@start, @destination).get_trip_duration
    end

    def calculate_time
        trip_duration = start_google_service(@start, @destination).get_trip_duration
        time_array = trip_duration.split(' ')
        total_hours = time_array[0].to_i
        total_minutes = time_array[3].to_i
        (Time.now + total_hours.hour + total_minutes.minutes).to_i
    end

    def forecast
        time = self.calculate_time
        latitude = start_google_service(@start, @destination).get_latitude
        longitude = start_google_service(@start, @destination).get_longitude
        start_weather_service(@destination).get_future_weather(latitude, longitude, time)
    end

    def restaurant
        latitude = start_google_service(@start, @destination).get_latitude
        longitude = start_google_service(@start, @destination).get_longitude

    end

    def start_google_service(start, destination)
        GoogleDirectionsService.new(@start, @destination)
    end

    def start_weather_service(destination)
        WeatherService.new(@destination)
    end

    def start_yelp_service(latitude, longitude, cuisine)
        YelpService.new(@latitude, @longitude, @cuisine)
    end
end