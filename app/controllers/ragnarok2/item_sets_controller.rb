require_dependency "ragnarok2/application_controller"

module Ragnarok2
  class ItemSetsController < ApplicationController
    def index
      if params[:q].nil? || params[:q].length.zero?
        @item_sets = ItemSet.page(params[:page])
      else
        @item_sets = ItemSet.where("ragnarok2_translations_item_sets.translation LIKE ?", "%#{params[:q]}%").page(params[:page])
      end
      respond_with(@item_sets)
    end

    def show
      respond_with(@item_set = ItemSet.find(params[:id]))
    end  
  end
end
