module Ragnarok2 
  class ApplicationController < GameHandler::GameController

    def url_options
      { :game_locale => "en" }.merge(super)
    end

    def game_id
      "ro2"
    end

    def redirect_on_error
      ragnarok2.root_url
    end
  end
end