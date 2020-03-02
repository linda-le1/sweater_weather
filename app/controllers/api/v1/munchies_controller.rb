class Api::V1::MunchiesController < ApplicationController

    def index
        munchies_results = MunchiesFacade.new(params['start'], params['end'], params['food'])
        render json: MunchiesSerializer.new(munchies_results)
    end

end