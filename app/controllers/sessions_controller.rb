class SessionsController < ApplicationController

    def signin
        @user = User.find_by(name: params[:user_name])
        if @user && @user.authenticate(params[:password])
           session[:user_id] = @user.id
           redirect_to user_path(@user) 
        else
            render './users/signin'
        end
    end

    def destroy
        reset_session
        redirect_to '/'
    end

end