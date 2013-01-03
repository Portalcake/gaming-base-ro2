require_dependency "ragnarok2/application_controller"

module Ragnarok2
  class ExpController < ApplicationController

    def index 
      respond_with(@exp = BaseExp.order("base_level ASC").all)
    end
  end
end
