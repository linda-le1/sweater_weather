class GoogleService

    def initialize(location)
        @location = location.gsub(",", "+")
    end

    def get_json_coordinates
        @response ||= make_connection.get("maps/api/geocode/json?address=#{@location}&key=#{ENV['GEOCODE_API']}")
        JSON.parse(@response.body)['results']
    end

    private

    def make_connection
        Faraday.new('https://maps.googleapis.com/') do |f|
            f.adapter Faraday.default_adapter
        end
    end

end