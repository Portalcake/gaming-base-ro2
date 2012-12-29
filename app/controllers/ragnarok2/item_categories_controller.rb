module Ragnarok2
  class ItemCategoriesController < ApplicationController

    def show
      respond_with(@items = Item.where(:category_id=>params[:id]).page(params[:page]))
    end

  end
end
