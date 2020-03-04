require 'rails_helper'

RSpec.describe 'Road Trips' do
    context "when the user provides a valid api token" do
        it "allows the user to pass" do

            User.create(email: 'whatever@example.com', password: '123', password_confirmation: '123', api_key: "jgn983hy48thw9begh98h4539h4")

            params = {
                "origin": "Denver,CO",
                "destination": "Pueblo,CO",
                "api_key": "jgn983hy48thw9begh98h4539h4"
                    }

            post "/api/v1/roadtrip", params: params

            trip_data = JSON.parse(response.body)

            expect(response).to be_successful
            expect(trip_data['data']['attributes']).to have_key('origin')
            expect(trip_data['data']['attributes']).to have_key('destination')
            expect(trip_data['data']['attributes']).to have_key('travel_time')
            expect(trip_data['data']['attributes']).to have_key('arrival_forecast')
        end
    end
end