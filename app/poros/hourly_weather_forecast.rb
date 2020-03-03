class HourlyWeatherForecast
    attr_reader :time, :temperature, :summary

    def initialize(info, timezone)
        @summary = info['summary']
        @time = Time.at(info['time']).in_time_zone(timezone)
        @temperature = info['temperature'].round(0)
    end

end
