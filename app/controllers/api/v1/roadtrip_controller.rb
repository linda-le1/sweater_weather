class Api::V1::RoadtripController < ApplicationController

    def create
        user = User.find_by(api_key: params['api_key'])
        if user
            roadtrip = Roadtrip.new(params['origin'], params['destination'])
            render json: RoadtripSerializer.new(roadtrip)
        else
            render json: {
                error: 'Something went wrong. Please try again.',
                status: 400
                            },
                status: :bad_request
        end
    end
end