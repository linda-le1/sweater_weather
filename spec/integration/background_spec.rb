require 'swagger_helper'

RSpec.describe 'api/v1/backgrounds', type: :request do
    path '/api/v1/backgrounds' do
        get 'Returns a background image url' do
            consumes 'application/json'
            produces 'application/json'
            parameter name: :location, in: :query, type: :string, required: true
            let(:location) { 'denver,co'}
            response '200', :success do
                schema type: :object,
                properties: {
                    id: { type: :integer },
                    url: { type: :string }
                }
                run_test!
            end
        end
    end
end
