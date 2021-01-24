class IcebreaksController < ApplicationController

    before_action :move_to_signed_in
 

    def index
        @icebreaks = Icebreak.all
    end

    def show
        @icebreak = Icebreak.find_by(id: params[:id])
        @comment = Comment.where(icebreak_id: params[:id])
        #icebreakに紐づいたコメントを取得
        # @star_sum = @comment.sum(:star)
        @star_ave =  @comment.average(:star).round
        #icebreakに紐づいたstarの数を四捨五入して取得
        
    end

    def create
        @icebreak = Icebreak.new(
          name: params[:name],
          description: params[:description]
        )
        @icebreak.save
        redirect_to("/icebreaks")
    end

    def edit
        @icebreak = Icebreak.find_by(id: params[:id])
    end

    def update
        @icebreak = Icebreak.find_by(id: params[:id])
        @icebreak.name = params[:name]
        @icebreak.description = params[:description]
        if @icebreak.save
            flash[:notice] = "アイスブレイク情報を更新しました"
            redirect_to("/icebreaks/#{@icebreak.id}")
        else
            render("icebreaks/edit")
        end
    end

    def destroy
        @icebreak = Icebreak.find_by(id: params[:id])
        @icebreak.destroy
        redirect_to("/icebreaks")
    end

    private
    def move_to_signed_in
      unless user_signed_in?
        #サインインしていないユーザーはログインページが表示される
        redirect_to  '/users/sign_in'
      end
    end








end