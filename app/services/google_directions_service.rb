class GoogleDirectionsService

    def initialize(start, destination)
        @start = start
        @destination = destination
    end

    def get_directions
        google_api_response = Faraday.get("https://maps.googleapis.com/maps/api/directions/json?origin=#{@start}&destination=#{@destination}&key=#{ENV['GEOCODE_API']}")
        JSON.parse(google_api_response.body)
        time = google_response['routes'][0]['legs'][0]['duration']
        time = (Time.now + 1.hour + 48.minutes).to_i
    end

    def get_trip_duration
        results = self.get_directions
        time = results['routes'][0]['legs'][0]['duration']
    end

    def get_latitude
        results = self.get_directions
        time = results['routes'][0]['legs'][0]['end_location']['lat']
    end

    def get_longitude
        results = self.get_directions
        time = results['routes'][0]['legs'][0]['end_location']['lng']
    end

    def get_end_location
        results = self.get_directions
        time = results['routes'][0]['legs'][0]['end_location']
    end
end