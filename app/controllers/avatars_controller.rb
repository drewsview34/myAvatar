class AvatarsController < ApplicationController

    def create

    end

    def update

    end

    private
    
    def avatar_params
        params.require(:avatar).permit(:option_id, :user_id)
    end

end
