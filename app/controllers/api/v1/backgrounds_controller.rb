class Api::V1::BackgroundsController < ApplicationController

    def index
        Faraday.get()
    end

end
