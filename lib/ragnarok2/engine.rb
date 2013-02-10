module Ragnarok2
  class Engine < ::Rails::Engine
    isolate_namespace Ragnarok2

    # Enabling assets precompiling under rails 3.1
    if Rails.version >= '3.1'
      initializer :assets do |config|
        Rails.application.config.assets.precompile += %w( ragnarok2/* )
      end
    end

    #load locales in subdirectories
    paths["config/locales"] << "config/locales/helpers"
    paths["config/locales"] << "config/locales/activerecords"

  end
end
