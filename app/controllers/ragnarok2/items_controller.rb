module Ragnarok2
  class ItemsController < ApplicationController

    def index
      if params[:q].nil? || params[:q].length.zero?
        @items = Item.page(params[:page])
      else
        @items = Item.where("ragnarok2_translations_item_names.translation LIKE ?", "%#{params[:q]}%").page(params[:page])
      end
      respond_with(@items)
    end

    def show
      respond_with(@item = Item.find(params[:id]))
    end

  end
end
