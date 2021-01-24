class CommentsController < ApplicationController

    before_action :move_to_signed_in

    def create
        
        @comment = Comment.new(user_id: params[:user_id],icebreak_id:params[:icebreak_id],content: params[:content],star: params[:star])      
        @comment.save
        redirect_to("/icebreaks")
    end

    def show
        @comment = Comment.find_by(id: params[:id])
    end
   
    def edit
        @comment = Comment.find_by(id: params[:id])
    end

    def update
        @comment = Comment.find_by(id: params[:id])
        @comment.content = params[:content]
        
        if @comment.save
            flash[:notice] = "コメントを更新しました"
            redirect_to("/comments/#{@comment.id}")
        else
            render("comment/#{@comment.id}/edit")
        end
    end

    def destroy
        @comment = Comment.find_by(id: params[:id])
        @comment.destroy
        redirect_to("/icebreaks")
    end

    private
    def move_to_signed_in
      unless user_signed_in?
        redirect_to  '/users/sign_in'
      end
    end

    
end

