require_dependency "ragnarok2/application_controller"

module Ragnarok2
  class DungeonsController < ApplicationController

    def index
      if params[:q].nil? || params[:q].length.zero?
        @dungeons = Dungeon.page(params[:page])
      else
        @dungeons = Dungeon.where("ragnarok2_dungeons.name LIKE ?", "%#{params[:q]}%").page(params[:page])
      end
      respond_with(@dungeons)
    end

    def show
      respond_with(@dungeon = Dungeon.find(params[:id]))
    end

  end
end
