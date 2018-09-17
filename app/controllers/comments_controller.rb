class CommentsController < ApplicationController

    def new
        @comment = Comment.new
    end
    def show
    end
    def create
        Comment.create()
    end
    def destroy

    end
    def update
    end
    def comment_params
        params.require(:comment).permit(:user_id,:post_id,:body)
    end

end
