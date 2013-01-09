require_dependency "ragnarok2/application_controller"

module Ragnarok2
  class NewsController < ApplicationController


    def index
      @news = {}
      @news[:games] = ::News.published.where(:game_id=>@game.id).page(params[:page])
      @news[:gaming_base] = ::News.published.where(:game_id=>nil).limit(7)
      respond_with(@news, :template=>"/news/index")
    end

    def show
      @news = ::News.where(:game_id=>@game.id).find(params[:id])
      authorize!(:show, @news)
      respond_with(@news, :template=>"/news/show")
    end
  end
end
