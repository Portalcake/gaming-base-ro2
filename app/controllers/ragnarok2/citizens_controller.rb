require_dependency "ragnarok2/application_controller"

module Ragnarok2
  class CitizensController < ApplicationController

    def index
      if params[:q].nil? || params[:q].length.zero?
        @citizens = Citizen.default_order.page(params[:page])
      else
        @citizens = Citizen.default_order.where("ragnarok2_translations_citizen_names.translation LIKE ?", "%#{params[:q]}%").page(params[:page])
      end
      respond_with(@citizens)
    end

    def show
      respond_with(@citizen = Citizen.find(params[:id]))
    end

  end
end
