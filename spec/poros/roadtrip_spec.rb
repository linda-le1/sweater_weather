require 'rails_helper'

RSpec.describe Roadtrip do
    it 'exists and has certain attributes' do
        WebMock.allow_net_connect!
        allow(Time).to receive(:now).and_return(Time.parse('2020-03-03 12:00:00 -0700'))

        origin = 'Denver,CO'
        destination = 'Pueblo, CO'
        roadtrip_poro = Roadtrip.new(origin, destination)

        expect(roadtrip_poro).to be_a Roadtrip
        expect(roadtrip_poro.travel_time).to eq('1 hour 48 mins')
        expect(roadtrip_poro.calculate_time).to eq(1583265600)
        expect(roadtrip_poro.get_coordinates).to eq({"lat"=>38.2542053, "lng"=>-104.6087488})
        expect(roadtrip_poro.arrival_forecast.summary).to eq('Clear')
        expect(roadtrip_poro.arrival_forecast.temperature).to eq(56)
    end
end