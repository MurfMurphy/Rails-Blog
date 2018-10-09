class PostsController < ApplicationController
    def new
        @post = Post.new
    end

    def index
        @post = Post.all
    end
    def show
        login_check
        @current_user = current_user
        @post = Post.find(params[:id])
        @comment = @post.comments.build
    end

    def create
        @user = current_user
        post = Post.create(user_id: @user.id, title: params[:title], body: params[:body], posted_at: Time.now.strftime("%d/%m/%Y %H/%M"))

        redirect_to '/'

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
    def post_params
        params.require(:post).permit(:title, :body)
    end
end