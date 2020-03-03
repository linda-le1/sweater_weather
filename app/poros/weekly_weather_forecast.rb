class WeeklyWeatherForecast
    attr_reader :summary, :time, :temperature_low, :temperature_high, :humidity

    def initialize(info)
        @time = info['time']
        @summary= info['summary']
        @temperature_low = info['temperatureLow'].round(0)
        @temperature_high = info['temperatureHigh'].round(0)
        @humidity = (info['humidity'] * 100).to_s + '%'
    end
end