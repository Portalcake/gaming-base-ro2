require_dependency "ragnarok2/application_controller"

module Ragnarok2
  class KharasController < ApplicationController
    def index
      respond_with(@kharas = Khara.main_quests.default_order.search(params[:q]).page(params[:page]))
    end

    def show
      respond_with(@khara = Khara.find(params[:id]))
    end
  end
end
