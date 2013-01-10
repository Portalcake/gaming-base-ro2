require_dependency "ragnarok2/application_controller"

module Ragnarok2
  class SkillGroupsController < ApplicationController

    def index
      if params[:q].nil? || params[:q].length.zero?
        @skillgroups = SkillGroup
      else
        @skillgroups = SkillGroup.where("ragnarok2_skill_groups.name_fallback LIKE ?", "%#{params[:q]}%")
      end
      respond_with(@skillgroups = @skillgroups.default_order.search(:learnable=>params[:learnable]).page(params[:page]))
    end

    def show
      respond_with(@skillgroup = SkillGroup.find(params[:id]))
    end

  end
end
