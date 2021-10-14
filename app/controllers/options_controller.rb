class OptionsController < ApplicationController

    def index
        @options = Option.all
    end

    def new
        @option = Option.new
    end

    def edit
        @option = Option.find_by(id: params[:id])
        @avatar = @option.avatars.build(user_id: current_user.id)
    end

    def update
        @option = Option.find_by(id: params[:id])
        @option.update(option_params)
        redirect_to option_path(@option)
    end

    def create
        @option = Option.create(option_params)
        redirect_to option_path(@option)
    end

    def show
        @option = Option.find_by(id: params[:id])
        @avatar = @option.avatars.build(user_id: @user.id)
    end

    
    private

    def option_params
        params.require(:option).permit(:name, :super_power, :super_weakness)
    end

end
