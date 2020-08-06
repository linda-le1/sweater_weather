class HourlyWeatherForecast
    attr_reader :time, :icon, :summary, :temperature

    def initialize(info, timezone)
        @time = Time.at(info['time']).in_time_zone(timezone)
        @icon = info['icon']
        @summary = info['summary']
        @temperature = info['temperature'].round(0)
    end

end
