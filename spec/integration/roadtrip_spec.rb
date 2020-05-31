require 'swagger_helper'

RSpec.describe 'api/v1/roadtrip', type: :request do
    path '/api/v1/roadtrip' do
        post 'returns road trip information including travel time and arrival weather forecast' do
            produces 'application/json'
            parameter name: :origin, in: :query, type: :string, required: true
            parameter name: :destination, in: :query, type: :string, required: true
            parameter name: :api_key, in: :query, type: :string, required: true
            let!(:users) do
                User.create!(email: "whatever@example.com", password: 'pass', password_confirmation: 'pass', api_key: ENV['API_Key'])
            end
            let(:origin) { 'denver,co' }
            let(:destination) { 'pueblo,co' }
            let(:api_key) { ENV['API_Key'] }
            response '200', :success do
                schema type: :object,
                properties: {
                    id: { type: :integer },
                    origin: { type: :string },
                    destination: { type: :string },
                    arrival_forecast: { type: :string }
                }
                run_test!
            end
            response '400', 'invalid request' do
                let(:origin) { 'denver,co' }
                let(:destination) { 'pueblo,co' }
                let(:api_key) { '123' }
                run_test!
            end

        end
    end
end