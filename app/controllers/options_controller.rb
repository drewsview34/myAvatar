class OptionsController < ApplicationController

    def index

    end

    def new

    end

    def edit

    end

    def update

    end

    def create

    end

    def show

    end

    
    private

    def attraction_params
        params.require(:attraction).permit(:name, :super_power, :super_weakness)
    end

end
