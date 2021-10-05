class OptionsController < ApplicationController

    def index
        @options = Option.all
    end

    def new
        @option = Option.new
    end

    def edit
        @option = Option.find(params[:id])
    end

    def update
        @option = Option.find(params[:id])
        @option.update(option_params)
        redirect_to option_path(@option)
    end

    def create
        @option = Option.create(option_params)
        redirect_to option_path(@option)
    end

    def show
        @user = User.find(session[:user_id])
        @option = Option.find(params[:id])
        @avatar = @option.avatars.build(user_id: @user_id)
    end

    
    private

    def option_params
        params.require(:attraction).permit(:name, :super_power, :super_weakness)
    end

end
