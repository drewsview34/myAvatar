class SessionController < ApplicationController
    skip_before_action :verified_user, only: [:new, :signin]

    def signin
        @user = User.find_by(name: params[:user_id])
        if @user && @user.authenticate(params[:password_digest])
           session[:user_id] = @user.id
           redirect_to user_path(@user) 
        else
            render './users/signin'
        end
    end

    def new
        @user = User.new
    end

    def destroy
        session.delete(":user_id")
        redirect_to '/'
    end

end