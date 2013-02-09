require_dependency "ragnarok2/application_controller"

module Ragnarok2
  class QuestsController < ApplicationController

    def index
      respond_with(@quests = Quest.default_order.search(params[:q]).page(params[:page]))
    end

    def show
      respond_with(@quest = Quest.find(params[:id]))
    end

  end
end
