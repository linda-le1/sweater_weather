require 'rails_helper'

RSpec.describe "Background Image" do
  it 'can return background image based on location' do
    WebMock.allow_net_connect!

    location = 'denver,co'
    # get "/api/v1/backgrounds?location=#{location}"

    # expect(response).to be_successful
    # background = JSON.parse(response.body)
  end