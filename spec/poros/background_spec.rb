require 'rails_helper'

RSpec.describe Background, :vcr do
    it 'exists and has certain attributes' do
        location = 'Denver,CO'
        data = UnsplashService.new(location).get_json
        background_poro = Background.new(data)

        expect(background_poro).to be_a Background
        expect(background_poro.id).to be(nil)
        expect(background_poro.url).to eq('https://unsplash.com/photos/N_tcaOWTSQQ')
    end
end