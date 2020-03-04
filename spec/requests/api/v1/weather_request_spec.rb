require 'rails_helper'

describe 'Weather Forecast' do
    it 'can return weather forecast based on location', :vcr do
        location = 'denver,co'

        allow(Time).to receive(:now).and_return(Time.parse('2020-03-02 12:00:00 -0700'))

        get "/api/v1/forecast?location=#{location}"

        expect(response).to be_successful
        weather_forecast = JSON.parse(response.body)['data']['attributes']

        expect(weather_forecast).to have_key('current_weather_results')
        expect(weather_forecast).to have_key('location_results')
        expect(weather_forecast).to have_key('hourly_forecast_results')
        expect(weather_forecast).to have_key('daily_forecast_results')
        expect(weather_forecast).to have_key('current_evening_summary')

        current_forecast = weather_forecast['current_weather_results']
        daily_forecast = weather_forecast['daily_forecast_results'][0]
        hourly_forecast = weather_forecast['hourly_forecast_results']
        location_results = weather_forecast['location_results']

        expect(location_results).to have_key('city')
        expect(location_results).to have_key('state')
        expect(location_results).to have_key('country')

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