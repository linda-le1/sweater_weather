require 'rails_helper'

RSpec.describe "Background Image", :vcr do
  it 'can return background image based on location' do
    location = 'denver,co'
    get "/api/v1/backgrounds?location=#{location}"

    expect(response).to be_successful
    background = JSON.parse(response.body)

    expect(background['data']).to have_key('id')
    expect(background['data']['id']).to eq(nil)
    expect(background['data']['attributes']).to have_key('url')
  end
end