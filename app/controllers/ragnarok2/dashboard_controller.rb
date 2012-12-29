module Ragnarok2
  class DashboardController < ApplicationController

    def localize
      respond_to do |format|
        format.html { 
          flash.keep
          redirect_to localized_root_path
        }
      end
    end

    def start
      respond_with()
    end
  end
end
