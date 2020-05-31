require 'swagger_helper'

RSpec.describe 'api/v1/forecast', type: :request do
    path '/api/v1/forecast' do
        get 'returns weather forecast information' do
            produces 'application/json'
            parameter name: :location, in: :query, type: :string, required: true
            let(:location) { 'denver,co' }
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
            # response '400', 'invalid request' do
            #     let(:location) { '!!!' }
            #     run_test!
            # end
        end
    end
end