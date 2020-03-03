class Api::V1::RoadtripController < ApplicationController

    def create
        authenticate_or_request_with_http_token do |token, _options|
            User.find_by(token: token)
          end
    end

end