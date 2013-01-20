require_dependency "ragnarok2/application_controller"

module Ragnarok2
  class ItemSetsController < ApplicationController
    def index
      @item_sets = ItemSet
      unless params[:q].nil? || params[:q].length.zero?
        @item_sets = @item_sets.default_order.where("ragnarok2_translations_item_sets.translation LIKE ?", "%#{params[:q]}%")
      end
      respond_with(@item_sets = @item_sets.default_order.includes(:parts).page(params[:page]))
    end

    def show
      respond_with(@item_set = ItemSet.find(params[:id]))
    end  
  end
end
