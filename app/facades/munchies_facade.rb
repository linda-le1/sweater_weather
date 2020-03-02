class MunchiesFacade

    def initialize(start, destination, cuisine)
        @id = nil
        @start = start
        @destination = destination
        @cuisine = cuisine
    end

    def end_location
        start_google_service.get_end_location
    end

    def travel_time
        start_google_service.get_trip_duration
    end

    def forecast
        time = (Time.now + 1.hour + 48.minutes).to_i
        
    end

    def restaurant
    end

    def start_google_service(start,destination)
        GoogleDirectionsService.new(start,destination)
    end

    def start_weather_service(destination)
        WeatherService.new(destination)
    end
end