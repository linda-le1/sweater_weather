class Api::V1::BackgroundsController < ApplicationController

    def index
        service = UnsplashService.new(params[:location])
        results = service.get_json
        render json: BackgroundSerializer.new(Background.new(results))
    end

end
