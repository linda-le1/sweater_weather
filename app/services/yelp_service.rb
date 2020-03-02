class YelpService
    attr_reader :latitude, :longitude, :cuisine, :time

    def initialize(latitude, longitude, cuisine, time)
        @latitude = latitude
        @longitude = longitude
        @cuisine = cuisine + ",restaurant"
        @time = time
    end

    def get_munchies
        retrieve_data("v3/businesses/search")
    end

    private

    def make_connection
        Faraday.new(url: 'https://api.yelp.com/') do |f|
            f.headers['Authorization'] = "Bearer #{ENV['YELP_API']}"
            f.params['latitude'] = "#{@latitude}"
            f.params['longitude'] = "#{@longitude}"
            f.params['categories'] = "#{@cuisine}"
            f.params['open_at'] ="#{@time}"
            f.adapter Faraday.default_adapter
        end
    end

    def retrieve_data(url)
        @response ||= make_connection.get(url)
        JSON.parse(@response.body)
    end
end