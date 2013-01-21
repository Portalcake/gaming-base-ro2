require_dependency "ragnarok2/application_controller"

module Ragnarok2
  class KharasController < ApplicationController
    def index
      @kharas = Khara
      unless params[:q].nil? || params[:q].length.zero?
        @kharas = @kharas.where("ragnarok2_translations_kharas.title LIKE ?", "%#{params[:q]}%")
      end
      respond_with(@kharas = @kharas.main_quests.default_order.page(params[:page]))
    end

    def show
      respond_with(@khara = Khara.find(params[:id]))
    end
  end
end
