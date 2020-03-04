require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'validations' do
        it { should validate_presence_of :email }
        it { should validate_uniqueness_of :email }
        it { should validate_presence_of :password }
        it { should validate_presence_of :password_digest }
        it { should have_secure_token :api_key }
        it { should have_secure_password }
    end

    describe 'existance' do
        it 'can be created' do
            user = User.create(email: 'admin@example.com', password: '123', password_confirmation: '123')
            expect(user.save).to eq(true)
            expect(user).to be_a(User)
            expect(user.errors.messages.empty?).to eq(true)
        end

        it 'can be created' do
            user = User.create(email: 'exampleemail@example.com', password: ' ', password_confirmation: '123')
            expect(user.save).to eq(false)
            expect(user.errors.messages.empty?).to eq(false)
        end
    end
end
