class WelcomeController < ApplicationController

    def index
        render json: 'Welcome to Sweather Weather. For documentation, visit https://github.com/linda-le1/sweater_weather.'
    end

end
