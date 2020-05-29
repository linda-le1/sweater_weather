class Location
    attr_reader :latitude, :longitude, :city, :state, :country, :timezone

    def initialize(info)
        @latitude= info[0]['geometry']['location']['lat']
        @longitude = info[0]['geometry']['location']['lng']
        @city = info[0]['address_components'][0]['long_name']
        @state = if info[0]['address_components'].count < 3
                    'N/A'
                else
                    info[0]['address_components'][2]['long_name']
                end
        @country = if info[0]['address_components'].count < 3
                    info[0]['address_components'][1]['long_name']
                else
                    info[0]['address_components'][3]['long_name']
                end
        @timezone = Timezone.lookup(@latitude, @longitude).to_s
    end

end