class DarkskyService
    def initialize(latitude, longitude)
        @latitude = latitude
        @longitude = longitude
    end

    def get_summary_weather
        @summary_response ||= make_connection.get("#{ENV['DARKSKY_API']}/#{@latitude},#{@longitude}?exclude=daily,hourly,minutely")
        JSON.parse(@summary_response.body)
    end

    def get_hourly_weather
        @hourly_response ||= make_connection.get("#{ENV['DARKSKY_API']}/#{@latitude},#{@longitude}?exclude=currently,minutely,daily")
        JSON.parse(@hourly_response.body)['hourly']['data'].first(25)
    end

    def get_daily_weather
        @daily_response ||= make_connection.get("#{ENV['DARKSKY_API']}/#{@latitude},#{@longitude}?exclude=currently,minutely,hourly")
        JSON.parse(@daily_response.body)['daily']['data'].first(8)
    end

    def get_future_weather(latitude, longitude, time)
        @future_response ||= make_connection.get("#{ENV['DARKSKY_API']}/#{latitude},#{longitude},#{time}")
        JSON.parse(@future_response.body)
    end


    private

    def make_connection
        Faraday.new('https://api.darksky.net/forecast/') do |f|
            f.adapter Faraday.default_adapter
        end
    end
end

