require 'rails_helper'

RSpec.describe "Munchie Endpoint" do
  it 'will return food and forecast information for a destination city' do
    WebMock.allow_net_connect!

    start = 'denver,co'
    destination = 'pueblo,co'
    cuisine = 'chinese'

    get "/api/v1/munchies?start=#{start}&end=#{destination}&food=#{cuisine}"

    expect(response).to be_successful

    destination_info = JSON.parse(response.body)['data']

    expect(destination_info).to have_key('id')
    expect(destination_info['id']).to eq(nil)
    expect(destination_info).to have_key('attributes')

    expect(destination_info['attributes']).to have_key('end_location')
    expect(destination_info['attributes']).to have_key('travel_time')
    expect(destination_info['attributes']).to have_key('forecast')
    expect(destination_info['attributes']).to have_key('restaurant')


    expect(destination_info['attributes']['restaurant']).to have_key('name')
    expect(destination_info['attributes']['restaurant']).to have_key('address')
  end
end