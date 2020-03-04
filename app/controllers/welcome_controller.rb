class WelcomeController < ApplicationController

    def index
        render json: {
            'Welcome to Sweather Weather. For more information on endpoints,
            visit https://github.com/linda-le1/sweater_weather'
                    }, status: :ok
    end

end
