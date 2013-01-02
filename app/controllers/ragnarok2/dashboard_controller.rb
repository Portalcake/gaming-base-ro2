require_dependency "ragnarok2/application_controller"

module Ragnarok2
  class DashboardController < ApplicationController

    def localize
      respond_to do |format|
        format.html { 
          flash.keep
          redirect_to news_index_path
        }
      end
    end

    def start
      respond_with()
    end
  end
end
