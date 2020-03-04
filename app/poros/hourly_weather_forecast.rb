class HourlyWeatherForecast
    attr_reader :time, :temperature, :summary

    def initialize(info, timezone)
        @time = Time.at(info['time']).in_time_zone(timezone)
        @summary = info['summary']
        @temperature = info['temperature'].round(0)
    end

end
