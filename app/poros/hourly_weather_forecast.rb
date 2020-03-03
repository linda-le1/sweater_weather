class HourlyWeatherForecast
    attr_reader :time, :temperature

    def initialize(info)
        @time = info['time']
        @temperature = info['temperature'].round(0)
    end

end
