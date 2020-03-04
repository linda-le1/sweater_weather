class CurrentWeatherForecast
    attr_reader :summary, :precipitation_probability, :temperature, :apparent_temperature, :humidity, :visibility, :uvIndex, :time

    def initialize(info, timezone)
        @time = Time.now.in_time_zone(timezone)
        @summary= info['currently']['summary']
        @temperature = info['currently']['temperature'].round(0)
        @apparent_temperature = info['currently']['apparentTemperature'].round(0)
        @precipitation_probability = (info['currently']['precipProbability'] * 100).to_s + '%'
        @humidity = (info['currently']['humidity'] * 100).round(2).to_s + '%'
        @visibility = info['currently']['visibility'].round(2).to_s + ' miles'
        @uvIndex = if info['currently']['uvIndex'] >= 0 && info['currently']['uvIndex'] <= 2
            info['currently']['uvIndex'].to_s + ' (Low)'
        elsif info['currently']['uvIndex'] >=3 && info['currently']['uvIndex'] <=5
            info['currently']['uvIndex'].to_s + ' (Moderate)'
        elsif info['currently']['uvIndex'] >=6 && info['currently']['uvIndex'] <=7
            info['currently']['uvIndex'].to_s + ' (High)'
        elsif info['currently']['uvIndex'] >=8 && info['currently']['uvIndex'] <=10
            info['currently']['uvIndex'].to_s + ' (Very High)'
        else
            info['currently']['uvIndex'] + ' (Extreme)'
        end
    end
end