class GoogleService

    def initialize(location)
        @location = location.gsub(",", "+")
    end

    def get_json_coordinates
        @response ||= make_connection.get("maps/api/geocode/json?address=#{@location}")
        JSON.parse(@response.body)['results']
    end

    def get_travel_info(origin, destination)
        @response ||= make_connection.get("maps/api/directions/json?origin=#{origin}&destination=#{destination}}")
        JSON.parse(@response.body)
    end

    private

    def make_connection
        Faraday.new('https://maps.googleapis.com/') do |f|
            f.params['key'] = "#{ENV['GEOCODE_API']}"
            f.adapter Faraday.default_adapter
        end
    end

end