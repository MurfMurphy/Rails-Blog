class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def profile
        login_check
        @current_user = current_user
    end

    def show
        @user = User.find(params[:id])
    end

    def index
        @user = User.all
        @post = Post.all.reverse
        @current_user = current_user
    end

    def create
        if params[:user][:password] != params[:user][:password_confirm]
            flash[:failure] = "Passwords must match!"
            return redirect_to new_user_path
        end
        if params[:user][:password].length < 6
            flash[:failure] = "Password must be longer than 6 characters!"
            return redirect_to new_user_path
        end
        if params[:user][:username].length > 15
            flash[:failure] = "Username must be shorter than 16 characters!"
            return redirect_to new_user_path
        end
        if User.where(username: params[:user][:username]).first
            flash[:failure] = "Username must be unique!"
            return redirect_to new_user_path
        end
        user = User.create(user_params)
        session[:user_id] = user.id
        flash[:success] = "User Created!"
        redirect_to '/'
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
    end

    def destroy
    end

    def current_user
        if session[:user_id]
            User.find(session[:user_id])
        end
    end

    def login_check
        if session[:user_id]
        else redirect_to new_session_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :fname, :lname, :email, :password)
    end
end
