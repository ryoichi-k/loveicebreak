class CommentsController < ApplicationController

    def new
        
    end

    def create
        @comment = Comment.new
        @comment.user_id = @current_user.id
    end
end
