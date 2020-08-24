class Api::V1::BackgroundsController < ApplicationController

    def index
        service = UnsplashService.new(params[:location])
        results = service.get_json
        if results['results'].empty?
                render json: {
                error: 'Something went wrong. Please try again!!!'
                            },
                status: :bad_request
        else
            render json: BackgroundSerializer.new(Background.new(results))
        end
    end

end
