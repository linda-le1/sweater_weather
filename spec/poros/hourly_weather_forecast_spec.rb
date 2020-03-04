require 'rails_helper'

RSpec.describe HourlyWeatherForecast do
    it 'exists and has certain attributes', :vcr do
        allow(Time).to receive(:now).and_return(Time.parse('2020-03-03 12:00:00 -0700'))
        forecast_data = DarkskyService.new(39.7392358, -104.990251).get_json_weather['hourly']['data']

        hourly_weather_poros = forecast_data.map do |data|
            HourlyWeatherForecast.new(data, 'America/Denver')
        end

        expect(hourly_weather_poros[0]).to be_a HourlyWeatherForecast
        expect(hourly_weather_poros[0].time).to eq('2020-03-03 23:00:00.000000000 -0700')
        expect(hourly_weather_poros[0].summary).to eq('Clear')
        expect(hourly_weather_poros[0].temperature).to eq(42)
    end
end