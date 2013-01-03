require_dependency "ragnarok2/application_controller"

module Ragnarok2
  class ItemCategoriesController < ApplicationController

    def show
      if params[:q].nil? || params[:q].length.zero?
        item_models = Item
      else
        item_models = Item.where("ragnarok2_translations_item_names.translation LIKE ?", "%#{params[:q]}%")
      end

      respond_with(@items = item_models.where(:category_id=>params[:id]).page(params[:page]))
    end

  end
end
