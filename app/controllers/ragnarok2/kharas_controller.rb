require_dependency "ragnarok2/application_controller"

module Ragnarok2
  class KharasController < ApplicationController
    def index
      if params[:q].nil? || params[:q].length.zero?
        @kharas = Khara.default_order.page(params[:page])
      else
        @kharas = Khara.default_order.where("ragnarok2_translations_kharas.title LIKE ?", "%#{params[:q]}%").page(params[:page])
      end
      respond_with(@kharas)
    end

    def show
      respond_with(@khara = Khara.find(params[:id]))
    end
  end
end
