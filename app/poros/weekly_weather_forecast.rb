class WeeklyWeatherForecast
    attr_reader :summary, :time, :icon, :temperature_low, :temperature_high, :humidity

    def initialize(info, timezone)
        @time = Time.at(info['time']).in_time_zone(timezone)
        @icon = info['icon']
        @summary= info['summary']
        @temperature_low = info['temperatureLow'].round(0)
        @temperature_high = info['temperatureHigh'].round(0)
        @humidity = (info['humidity'] * 100).to_s + '%'
    end
end