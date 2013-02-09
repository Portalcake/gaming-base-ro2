require_dependency "ragnarok2/application_controller"

module Ragnarok2
  class CitizensController < ApplicationController

    def index
      respond_with(@citizens = Citizen.page(params[:page]).default_order.search(params[:q]))
    end

    def show
      respond_with(@citizen = Citizen.find(params[:id]))
    end

  end
end
