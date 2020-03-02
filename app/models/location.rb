class Location
    attr_reader :latitude, :longitude, :city, :state, :country, :timezone

    def initialize(info)
        @latitude= info[0]['geometry']['location']['lat']
        @longitude = info[0]['geometry']['location']['lng']
        @city = info[0]['address_components'][0]['long_name']
        @state = info[0]['address_components'][2]['long_name']
        @country = info[0]['address_components'][3]['long_name']
        @timezone = Timezone.lookup(@latitude, @longitude).to_s
    end

end