class Restaurant
    attr_reader :name, :address

    def initialize(info)
        @name = info['businesses'][0]['name']
        @address = info['businesses'][0]['location']['display_address'][0]
    end
end