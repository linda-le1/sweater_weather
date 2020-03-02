require 'rails_helper'

describe 'Weather Forecast' do
    it 'can return weather forecast based on location' do
        WebMock.allow_net_connect!

        location = 'denver,co'

        get "/api/v1/forecast?location=#{location}"

        expect(response).to be_successful
        weather_forecast = JSON.parse(response.body)['data']['attributes']

        expect(weather_forecast).to have_key('current_weather_results')
        expect(weather_forecast).to have_key('daily_forecast_results')
        expect(weather_forecast).to have_key('hourly_forecast_results')

        current_forecast = weather_forecast['current_weather_results']
        daily_forecast = weather_forecast['daily_forecast_results'][0]
        hourly_forecast = weather_forecast['hourly_forecast_results']

        expect(current_forecast).to have_key('time')
        expect(current_forecast).to have_key('summary')
        expect(current_forecast).to have_key('precipitation_probability')
        expect(current_forecast).to have_key('temperature')
        expect(current_forecast).to have_key('apparent_temperature')
        expect(current_forecast).to have_key('humidity')
        expect(current_forecast).to have_key('visibility')
        expect(current_forecast).to have_key('uvIndex')

        expect(daily_forecast.count).to eq(5)
        expect(daily_forecast).to have_key('time')
        expect(daily_forecast).to have_key('temperature_low')
        expect(daily_forecast).to have_key('summary')
        expect(daily_forecast).to have_key('temperature_high')
        expect(daily_forecast).to have_key('humidity')

        expect(hourly_forecast.count).to eq(8)
        expect(hourly_forecast[0]).to have_key('time')
        expect(hourly_forecast[0]).to have_key('temperature')
    end
end