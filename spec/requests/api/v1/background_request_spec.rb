require 'rails_helper'

RSpec.describe "Background Image", :vcr do
  it 'returns background image based on location' do
    location = 'denver,co'
    get "/api/v1/backgrounds?location=#{location}"

    expect(response).to be_successful
    background = JSON.parse(response.body)

    expect(background['data']).to have_key('id')
    expect(background['data']['id']).to eq(nil)
    expect(background['data']['attributes']).to have_key('url')
  end

  it 'returns an error message if param is invalid' do
    location = '!!!'
    get "/api/v1/backgrounds?location=#{location}"

    expect(response).to_not be_successful
    message = JSON.parse(response.body)

    expect(message).to have_key('error')
    expect(message['error']).to eq('Something went wrong. Please try again.')
  end
end