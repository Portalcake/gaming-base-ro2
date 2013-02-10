require_dependency "ragnarok2/application_controller"

module Ragnarok2
  class ItemsController < ApplicationController

    def index
      respond_with(@items = Item.default_order.search(params[:q]).page(params[:page]))
    end

    def show
      respond_with(@item = Item.find(params[:id]))
    end

  end
end
