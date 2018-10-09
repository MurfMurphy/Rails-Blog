class CommentsController < ApplicationController

    def new
        user = current_user
        @comment = Comment.new(post_id: params[:post_id])
        @post = Post.find(params[:post_id])
    end
    def show
    end
    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = session[:user_id]
        @post = params[:id]
        if @comment.save
            flash[:notice] = "Creation Complete!"
            redirect_to '/'
        else
            flash[:failure] = "You were close, try again!"
            redirect_to '/'
        end
    end
    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to '/posts'
    end
    def edit
        @comment = Comment.find(params[:id])
    end
    def update
        @comment = Comment.find_by_id(params[:id])
        @comment.update(comment_params)
        flash[:notice] = "Updated!"
        redirect_to '/'
    end

    def current_user
        if session[:user_id]
            User.find(session[:user_id])
        end
    end

    private
    
    def comment_params
        params.require(:comment).permit(:body, :post_id)
    end


end
