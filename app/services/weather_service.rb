class WeatherService
    def initialize(location)
        @location = location.gsub(",", "+")
    end

    def get_weather
        response = Faraday.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{@location}&key=#{ENV['GEOCODE_API']}")
        parsed_location = JSON.parse(response.body)['results']
        location = Location.new(parsed_location)
        weather_response = Faraday.get("https://api.darksky.net/forecast/#{ENV['DARKSKY_API']}/#{location.latitude},#{location.longitude}?exclude=minutely")
        JSON.parse(weather_response.body)
    end

    def get_future_weather(latitude, longitude, time)
        weather_forecast = retrieve_data("#{ENV['DARKSKY_API']}/#{latitude},#{longitude},#{time}")
        weather_forecast['currently']['summary']
    end

    private

    def make_connection
        Faraday.new(url: 'https://api.darksky.net/forecast/') do |f|
            f.adapter Faraday.default_adapter
        end
    end

    def retrieve_data(url)
        @response ||= make_connection.get(url)
        JSON.parse(@response.body)
    end
end

