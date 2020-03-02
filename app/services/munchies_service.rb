class MunchiesService

    attr_reader :latitude, :longitude, :cuisine
    def initialize(latitude, longitude, cuisine, time)
        @latitude = latitude
        @longitude = longitude
        @cuisine = cuisine + ",restaurant"
        @time = time
    end

    def get_munchies
        yelp_response = Faraday.get("https://api.yelp.com/v3/businesses/search?latitude=#{latitude}&longitude=#{longitude}&open_at=#{time}&categories=#{cuisine}")do |f|
                        f.headers['Authorization'] = "Bearer #{ENV['YELP_API']}"
                        end
        JSON.parse(yelp_response.body)
    end
end