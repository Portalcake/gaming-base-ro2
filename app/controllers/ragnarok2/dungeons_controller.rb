require_dependency "ragnarok2/application_controller"

module Ragnarok2
  class DungeonsController < ApplicationController

    def index
      @dungeons = Dungeon
      unless params[:q].nil? || params[:q].length.zero?
        @dungeons = @dungeons.where("ragnarok2_dungeons.name LIKE ?", "%#{params[:q]}%")
      end
      respond_with(@dungeons = @dungeons.default_order.group("dungeon_group_id").page(params[:page]))
    end

    def show
      @dungeon = Dungeon.find(params[:id])
      @dungeons = Dungeon.where(:dungeon_group_id=>@dungeon.dungeon_group_id).default_order
      respond_with
    end

  end
end
