class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception
    before_action :verified_user
    helper_method :current_user

    def current_user
        @user ||=User.find(session[:user_id])
    end


    def verified_user
        redirect_to '/' unless user_is_authenticated
    end

    def user_is_authenticated
        !!current_user
    end


end
