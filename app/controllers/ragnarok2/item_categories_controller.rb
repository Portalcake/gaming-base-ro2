require_dependency "ragnarok2/application_controller"

module Ragnarok2
  class ItemCategoriesController < ApplicationController

    def show
      @item_category = ItemCategory.find(params[:id])
      @items = Item.default_order.where(:high_category_id => @item_category.high_category)

      unless @item_category.medium_category.zero?
        @items = @items.where(:medium_category_id => @item_category.medium_category)

        unless @item_category.low_category.zero?
          @items = @items.where(:low_category_id => @item_category.low_category)
        end
      end

      unless params[:q].nil? || params[:q].length.zero?
        @items = @items.where("ragnarok2_translations_item_names.translation LIKE ?", "%#{params[:q]}%")
      end

      respond_with(@items = @items.page(params[:page]))
    end

  end
end
