class MunchiesService

    attr_reader :latitude, :longitude, :cuisine
    def initialize(latitude, longitude, cuisine)
        @latitude = latitude
        @longitude = longitude
        @cuisine = cuisine + ",restaurant"
    end

    def get_munchies
        start = params['start'].gsub(",", "+")
        destination = params['end'].gsub(",", "+")
        cuisine = params['food']

        google_api_response = Faraday.get("https://maps.googleapis.com/maps/api/directions/json?origin=#{start}&destination=#{destination}&key=#{ENV['GEOCODE_API']}")
        google_response = JSON.parse(google_api_response.body)
        time = google_response['routes'][0]['legs'][0]['duration']
        # end = google_response['routes'][0]['legs'][0]['end_address']
        latitude = google_response['routes'][0]['legs'][0]['end_location']['lat']
        longitude = google_response['routes'][0]['legs'][0]['end_location']['lng']
        time = (Time.now + 1.hour + 48.minutes).to_i

        weather_forecast = Faraday.get("https://api.darksky.net/forecast/#{ENV['DARKSKY_API']}/#{latitude},#{longitude},#{time}")
        weather_response = JSON.parse(weather_forecast.body)['currently']['summary']

        yelp_response = Faraday.get("https://api.yelp.com/v3/businesses/search?latitude=#{latitude}&longitude=#{longitude}&open_at=1583174060&categories=#{cuisine},restaurant")do |f|
                        f.headers['Authorization'] = "Bearer #{ENV['YELP_API']}"
                        end

end