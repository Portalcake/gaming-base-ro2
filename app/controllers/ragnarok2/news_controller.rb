require_dependency "ragnarok2/application_controller"

module Ragnarok2
  class NewsController < ApplicationController


    def index
      respond_with(@news = ::News.where(:game_id=>@game.id).page(params[:page]), :template=>"/news/index")
    end

    def show
      respond_with(@news = ::News.where(:game_id=>@game.id).find(params[:id]), :template=>"/news/show")
    end
  end
end
