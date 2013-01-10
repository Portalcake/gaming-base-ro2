Ragnarok2::Engine.routes.draw do
  scope "/:locale/games/ro2" do
        scope ":game_locale",
          #https://github.com/rails/rails/issues/7144
          #:defaults => {:game_locale => "en"},
          :only => [:index, :show] do

          resources :quests, :citizens, :items, :maps,
                    :item_sets, :dungeons

          resources :skill_groups, :path=>"skills"
          
          resources :item_categories, :only => :show

          resources :news

          match "exp" => "exp#index", :as => :exp_overview
        end
        scope ":game_locale" do
          match "/" => "dashboard#start", :as => :localized_root
        end
        match "/" => "dashboard#localize", :as => :root
  end
end
