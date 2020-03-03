class Api::V1::UsersController < ApplicationController

    def create
        User.create(user_params)
        byebug
    end

    private

    def user_params
        params.permit(:email, :password, :password_confirmation)
    end

end
