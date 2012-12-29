module Ragnarok2 
  class ApplicationController < GameController
    #before_filter :set_game_language
    game_id :ro2
    
    respond_to :html

    def set_game_language
      #
    end

    def url_options
      { :game_locale => "en" }.merge(super)
    end
  end
end