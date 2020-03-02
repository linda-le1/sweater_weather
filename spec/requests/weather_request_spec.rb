require 'rails_helper'

describe 'Weather' do
    it 'can returns' do
        create_list(:customer, 5)

        get '/api/v1/customers'

        expect(response).to be_successful

        customers = JSON.parse(response.body)["data"]

        expect(customers.count).to eql(5)

    end