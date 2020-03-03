require 'rails_helper'

RSpec.describe 'Users' do
    it 'can create a new user and generate an api key' do
          params = {
                      email: "whatever@example.com",
                      password: "password",
                      password_confirmation: "password"
                    }

        post '/api/v1/users'

        expect(response.status).to eq(201)

        user_info = JSON.parse(response.body)

        expect(user_info).to have_key("api_key")
    end
end
