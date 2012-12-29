module Ragnarok2
  class QuestsController < ApplicationController

    def index
      if params[:q].nil? || params[:q].length.zero?
        @quests = Quest.page(params[:page])
      else
        @quests = Quest.where("ragnarok2_translations_quests.quest_title LIKE ?", "%#{params[:q]}%").page(params[:page])
      end
      respond_with(@quests)
    end

    def show
      respond_with(@quest = Quest.find(params[:id]))
    end

  end
end
