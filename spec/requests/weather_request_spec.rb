require 'rails_helper'

describe 'Weather' do
    it 'can return weather forecast based on location' do

        get '/api/v1/forecast?location=denver,co'

        expect(response).to be_successful

        coordinates = JSON.parse(response.body)['results']

        expect(expect(coordinates[0]['location']['lat']).to eql('39.7392358')
        expect(expect(coordinates[0]['location']['lng']).to eql('-104.990251')
    end
end