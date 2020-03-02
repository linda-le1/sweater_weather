class GoogleDirectionsService
    attr_reader :start, :destination

    def initialize(start, destination)
        @start = start
        @destination = destination
    end

    def get_directions
        retrieve_data('maps/api/directions/json')
    end

    def get_trip_duration
        results = self.get_directions
        results['routes'][0]['legs'][0]['duration']['text']
    end

    def get_coordinates
        results = self.get_directions
        results['routes'][0]['legs'][0]['end_location']
    end

    def get_end_location
        results = self.get_directions
        results['routes'][0]['legs'][0]['end_address']
    end

    private

    def make_connection
        Faraday.new(url: 'https://maps.googleapis.com/') do |f|
            f.params['origin'] = "#{@start}"
            f.params['destination'] = "#{@destination}"
            f.params['key'] = "#{ENV['GEOCODE_API']}"
        end
    end

    def retrieve_data(url)
        @response ||= make_connection.get(url)
        JSON.parse(@response.body)
    end

end