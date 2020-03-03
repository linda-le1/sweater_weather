class Api::V1::SessionsController < ApplicationController

    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            render json: UserSerializer.new(user), status: :ok
        else
            render json: {
                error: 'Credentials are invalid. Please try again.',
                status: 400
                            },
                status: :bad_request
        end
    end
end