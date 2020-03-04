require 'rails_helper'

RSpec.describe WeeklyWeatherForecast, :vcr do
    it 'exists and has certain attributes' do
        allow(Time).to receive(:now).and_return(Time.parse('2020-03-03 12:00:00 -0700'))
        forecast_data = DarkskyService.new(39.7392358, -104.990251).get_json_weather['daily']['data']

        weekly_weather_poros = forecast_data.map do |data|
            WeeklyWeatherForecast.new(data, 'America/Denver')
        end

        expect(weekly_weather_poros[0]).to be_a WeeklyWeatherForecast
        expect(weekly_weather_poros[0].time).to eq('2020-03-03 00:00:00.000000000 -0700')
        expect(weekly_weather_poros[0].summary).to eq('Clear throughout the day.')
        expect(weekly_weather_poros[0].temperature_low).to eq(27)
        expect(weekly_weather_poros[0].temperature_high).to eq(62)
        expect(weekly_weather_poros[0].humidity).to eq('31.0%')
    end
end