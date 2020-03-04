require 'rails_helper'

RSpec.describe Location do
    it 'exists and has certain attributes', :vcr do
        allow(Time).to receive(:now).and_return(Time.parse('2020-03-03 12:00:00 -0700'))
        location = 'Denver,CO'
        location_poro = WeatherForecast.new(location).location_results

        expect(location_poro).to be_a Location
        expect(location_poro.latitude).to eq(39.7392358)
        expect(location_poro.longitude).to eq(-104.990251)
        expect(location_poro.city).to eq('Denver')
        expect(location_poro.state).to eq('Colorado')
        expect(location_poro.country).to eq('United States')
        expect(location_poro.timezone).to eq('America/Denver')
    end
end