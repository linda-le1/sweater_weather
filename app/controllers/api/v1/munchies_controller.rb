class Api::V1::MunchiesController < ApplicationController

    def index
        start = params['start'].gsub(",", "+")
        destination = params['end'].gsub(",", "+")
        cuisine = params['food']
        munchies_results = MunchiesFacade.new(start, destination, cuisine)

        # google_api_response = Faraday.get("https://maps.googleapis.com/maps/api/directions/json?origin=#{start}&destination=#{destination}&key=#{ENV['GEOCODE_API']}")
        # google_response = JSON.parse(google_api_response.body)
        # time = google_response['routes'][0]['legs'][0]['duration']
        # # end = google_response['routes'][0]['legs'][0]['end_address']
        # latitude = google_response['routes'][0]['legs'][0]['end_location']['lat']
        # longitude = google_response['routes'][0]['legs'][0]['end_location']['lng']
        # time = (Time.now + 1.hour + 48.minutes).to_i

        # weather_forecast = Faraday.get("https://api.darksky.net/forecast/#{ENV['DARKSKY_API']}/#{latitude},#{longitude},#{time}")
        # weather_response = JSON.parse(weather_forecast.body)['currently']['summary']

        # yelp_response = Faraday.get("https://api.yelp.com/v3/businesses/search?latitude=#{latitude}&longitude=#{longitude}&open_at=1583174060&categories=#{cuisine},restaurant")do |f|
        #                 f.headers['Authorization'] = "Bearer #{ENV['YELP_API']}"
        #                 end
        # restaurant_info = JSON.parse(yelp_response.body)
        # restaurant_name = restaurant_info['businesses'][0]['name']
        # restaurant_address = restaurant_info['businesses'][0]['location']['display_address']
    end

end