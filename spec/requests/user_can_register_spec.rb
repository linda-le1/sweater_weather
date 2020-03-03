require 'rails_helper'

RSpec.describe 'Users' do
    it 'can create a new user and generate an api key' do
          params = {
                      email: "whatever@example.com",
                      password: "password",
                      password_confirmation: "password"
                    }

        post '/api/v1/users', params: params

        expect(response.status).to eq(201)

        user_info = JSON.parse(response.body)

        expect(user_info['data']['attributes']).to have_key("api_key")
        expect(user_info['data']['attributes']['api_key']).not_to eql(nil)
    end

    it 'can return a 400 response if user cannot be created' do
      User.create(email: 'whatever@example.com', password: '11111', password_confirmation: '11111')
      params = {
                  email: "whatever@example.com",
                  password: "password",
                  password_confirmation: "password"
                }

    post '/api/v1/users', params: params

    expect(response.status).to eq(400)

    user_info = JSON.parse(response.body)
                byebug
    expect(user_info['data']['attributes']).to have_key("error")
    expect(user_info['data']['attributes']['error']).to eql('Email has already been taken')
  end
end
