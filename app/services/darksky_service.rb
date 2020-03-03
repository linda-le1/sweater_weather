class DarkskyService
    def initialize(latitude, longitude)
        @latitude = latitude
        @longitude = longitude
    end

    def get_json_weather
        @response ||= make_connection.get("#{ENV['DARKSKY_API']}/#{@latitude},#{@longitude}?exclude=minutely")
        JSON.parse(@response.body)
    end

    private

    def make_connection
        Faraday.new('https://api.darksky.net/forecast/') do |f|
            f.adapter Faraday.default_adapter
        end
    end
end

