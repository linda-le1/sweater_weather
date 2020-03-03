class UnsplashService

    def initialize(search_query)
        @search_query = search_query.gsub(",", "+")
    end

    def get_json
        @response ||= make_connection.get("search/photos?page=1&query=#{@search_query}")
        JSON.parse(@response.body)
    end

    private

    def make_connection
        Faraday.new('https://api.unsplash.com/') do |f|
            f.headers['Authorization'] = "Client-ID #{ENV['UNSPLASH_API']}"
            f.headers['Accept-Version'] = 'v1'
            f.adapter Faraday.default_adapter
        end
    end

end