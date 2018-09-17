class HomeController < ApplicationController
    def index
        @user = User.all
        @post = Post.all

        @current_user = current_user
    end
    def current_user
        if session[:user_id]
            User.find(session[:user_id])
        end
    end
end