require 'rails_helper'

RSpec.describe WeeklyWeatherForecast, :vcr do
    it 'exists and has certain attributes' do
        allow(Time).to receive(:now).and_return(Time.parse('2020-05-29 00:00:00 -0600'))
        forecast_data = DarkskyService.new(39.7392358, -104.990251).get_daily_weather

        weekly_weather_poros = forecast_data.map do |data|
            WeeklyWeatherForecast.new(data, 'America/Denver')
        end

        expect(weekly_weather_poros[0]).to be_a WeeklyWeatherForecast
        expect(weekly_weather_poros[0].time.to_s).to eq('2020-05-29 00:00:00 -0600')
        expect(weekly_weather_poros[0].summary).to eq('Clear throughout the day.')
        expect(weekly_weather_poros[0].temperature_low).to eq(61)
        expect(weekly_weather_poros[0].temperature_high).to eq(90)
        expect(weekly_weather_poros[0].humidity).to eq('49.0%')
    end
end