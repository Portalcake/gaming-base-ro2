require_dependency "ragnarok2/application_controller"

module Ragnarok2
  class ItemCategoriesController < ApplicationController
    helper "Ragnarok2/Items"

    def show
      @item_category = ItemCategory.find(params[:id])
      @items = Item.default_order.search(params[:q]).where(:high_category_id => @item_category.high_category).page(params[:page])

      unless @item_category.medium_category.zero?
        @items = @items.where(:medium_category_id => @item_category.medium_category)

        unless @item_category.low_category.zero?
          @items = @items.where(:low_category_id => @item_category.low_category)
        end
      end

      respond_with(@items)
    end

  end
end
