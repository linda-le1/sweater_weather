require 'rails_helper'

RSpec.describe "Root URL", :vcr do
    it 'can see some JSON on root domain' do
        get '/'
        expect(response.body).to eq("Welcome to Sweather Weather. For documentation, visit https://github.com/linda-le1/sweater_weather.")
        expect(response).to be_successful
    end
end