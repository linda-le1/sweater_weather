require 'rails_helper'

RSpec.describe CurrentWeatherForecast do
    it 'exists and has certain attributes', :vcr do
        allow(Time).to receive(:now).and_return(Time.parse('2020-03-03 12:00:00 -0700'))
        forecast_data = DarkskyService.new(39.7392358, -104.990251).get_summary_weather
        current_weather_poro = CurrentWeatherForecast.new(forecast_data, 'America/Denver')

        expect(current_weather_poro).to be_a CurrentWeatherForecast
        expect(current_weather_poro.time).to eq('2020-03-03 12:00:00.000000000 -0700')
        expect(current_weather_poro.summary).to eq('Mostly Cloudy')
        expect(current_weather_poro.temperature).to eq(48)
        expect(current_weather_poro.apparent_temperature).to eq(45)
        expect(current_weather_poro.precipitation_probability).to eq('0%')
        expect(current_weather_poro.humidity).to eq('47.0%')
        expect(current_weather_poro.visibility).to eq('10 miles')
        expect(current_weather_poro.uvIndex).to eq('1 (Low)')
        expect(current_weather_poro.icon).to eq('partly-cloudy-day')
    end
end