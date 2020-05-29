require 'rails_helper'

RSpec.describe WeatherForecast, :vcr do
    before :each do
        allow(Time).to receive(:now).and_return(Time.parse('2020-03-03 12:00:00 -0700'))
        @weather_forecast_poro = WeatherForecast.new('Denver,CO')
    end

    it 'exists and has certain attributes' do
        expect(@weather_forecast_poro).to be_a WeatherForecast
        expect(@weather_forecast_poro.location).to eq('Denver,CO')
    end

    it 'can return current weather results' do
        current_forecast = @weather_forecast_poro.current_weather_results
        expect(current_forecast).to have_key('current_forecast')
        expect(current_forecast).to have_key('current_evening_forecast')
    end

    it 'can return a full hourly forecast' do
        full_hourly_forecast = @weather_forecast_poro.all_hourly_results
        expect(full_hourly_forecast.count).to eq(25)
    end

    it "can return a day's worth of hourly forecast results" do
        hourly_forecast = @weather_forecast_poro.hourly_forecast_results
        expect(hourly_forecast.count).to eq(8)
    end

    it 'can return weekly forecast results' do
        weekly_forecast = @weather_forecast_poro.weekly_forecast_results
        expect(weekly_forecast.count).to eq(8)
    end

    it 'can return current evening results' do
        evening_forecast = @weather_forecast_poro.current_evening_results
        expect(evening_forecast).to eq('Clear')
    end

    it 'can return coordinates' do
        coordinates = @weather_forecast_poro.location_results
        expect(coordinates.latitude).to eq(39.7392358)
        expect(coordinates.longitude).to eq(-104.990251)
    end
end