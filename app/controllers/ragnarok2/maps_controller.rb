require_dependency "ragnarok2/application_controller"

module Ragnarok2
  class MapsController < ApplicationController

    def index
      @maps = Map
      unless params[:q].nil? || params[:q].length.zero?
        @maps = @maps.where("ragnarok2_maps.name LIKE ?", "%#{params[:q]}%")
      end
      respond_with(@maps = @maps.default_order.page(params[:page]))
    end

    def show
      respond_with(@map = Map.find(params[:id]))
    end

  end
end
