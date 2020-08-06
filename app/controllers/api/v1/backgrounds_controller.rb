class Api::V1::BackgroundsController < ApplicationController

    def index
        service = UnsplashService.new(params[:location])
        render json: BackgroundSerializer.new(Background.new(service.get_json))
    end

end
