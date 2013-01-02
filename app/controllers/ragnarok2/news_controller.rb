require_dependency "ragnarok2/application_controller"

module Ragnarok2
  class NewsController < ApplicationController


    def index
      respond_with(@news = ::News.published.where(:game_id=>@game.id).page(params[:page]), :template=>"/news/index")
    end

    def show
      @news = ::News.where(:game_id=>@game.id).find(params[:id])
      authorize!(:show, @news)
      respond_with(@news, :template=>"/news/show")
    end
  end
end
