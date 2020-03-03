require 'rails_helper'

RSpec.describe 'Sessions' do
    it 'can login with valid credentials and their api key is returned' do
        User.create(email: 'whatever@example.com', password: 'password', password_confirmation: 'password')

            params = {
                        email: 'whatever@example.com',
                        password: 'password',
                    }

            post '/api/v1/sessions', params: params

            login_data = JSON.parse(response.body)

            expect(response.status).to eq(200)

            expect(login_data['data']['attributes']).to have_key("api_key")
            expect(login_data['data']['attributes']['api_key']).not_to eql(nil)
    end

    it 'can return an error message if invalid credentials are entered' do
        User.create(email: 'whatever@example.com', password: 'password', password_confirmation: 'password')

            params = {
                        email: 'whatever@example.com',
                        password: '12345',
                    }

            post '/api/v1/sessions', params: params

            login_data = JSON.parse(response.body)

            expect(response.status).to eq(400)

            expect(login_data).to have_key('error')
            expect(login_data['error']).to eql('Credentials are invalid. Please try again.')
    end
end
