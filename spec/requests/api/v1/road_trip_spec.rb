require 'rails_helper'

RSpec.describe 'Road Trips' do
    context "when the user provides a valid api token" do
        it "allows the user to pass" do
            WebMock.allow_net_connect!

            User.create(email: 'whatever@example.com', password: '123', password_confirmation: '123', api_key: "12345wootwoot")

            params = {
                "origin": "Denver,CO",
                "destination": "Pueblo,CO",
                "api_key": "12345wootwoot"
                    }

            post "/api/v1/roadtrip", params: params

            trip_data = JSON.parse(response.body)

            expect(response).to be_successful

            expect(trip_data['data']['attributes']).to have_key('Origin')
            expect(trip_data['data']['attributes']).to have_key('Destination')
            expect(trip_data['data']['attributes']).to have_key('Travel Time')
            expect(trip_data['data']['attributes']).to have_key('Arrival Forecast')
        end
    end
end