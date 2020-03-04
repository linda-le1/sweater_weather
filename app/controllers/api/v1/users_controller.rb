class Api::V1::UsersController < ApplicationController

    def create
        user = User.create(user_params)
            if user.save
                render json: UserSerializer.new(user.api_key), status: :created
            else
                render json: {
                error: user.errors.full_messages.to_sentence,
                status: 400
                            },
                status: :bad_request
            end
    end

    private

    def user_params
        params.permit(:email, :password, :password_confirmation)
    end

end
