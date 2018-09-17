class SessionsController < ApplicationController
    def new
    end
    def create
        user = User.where(username: params[:username]).first
        if user.present? && user.password == params[:password]
            session[:user_id] = user.id
            flash[:success] = "You have been logged in!"
            redirect_to '/'
        else
            flash[:failure] = "Username or password didn't match?!?!"
            redirect_to '/signin'
        end
    end
    def destroy
        session[:user_id] = nil
        flash[:notice] = "You have been signed out!"
        redirect_to '/'
    end
end