class Api::V1::MunchiesController < ApplicationController

    def index
        start = params['start'].gsub(",", "+")
        destination = params['end'].gsub(",", "+")
        cuisine = params['food']
        google_api_response = Faraday.get("https://maps.googleapis.com/maps/api/directions/json?origin=#{start}&destination=#{destination}&key=#{ENV['GEOCODE_API']}")

        google_response = JSON.parse(google_api_response.body)
        # time = google_response['routes'][0]['legs'][0]['duration']
        # end = google_response['routes'][0]['legs'][0]['end_address']
        # coordinates = google_response['routes'][0]['legs'][0]['end_location']

    end

end