class AvatarsController < ApplicationController

    def create
        @avatar = Avatar.create(avatar_params)
        redirect_to user_path(@user)
    end

    def update
        @avatar = Avatar.find(params[:id])
    end

    private
    
    def avatar_params
        params.require(:avatar).permit(:option_id, :user_id)
    end

end
