class IcebreaksController < ApplicationController
    def index
        @icebreaks = Icebreak.all
    end

    def show
        @icebreak = Icebreak.find_by(id: params[:id])
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
end
