$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ragnarok2/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ragnarok2"
  s.version     = Ragnarok2::VERSION
  s.authors     = ["Noxx"]
  s.email       = ["webmaster@gaming-base.net"]
  s.homepage    = "http://www.gaming-base.net"
  s.summary     = "Ragnarok 2"
  s.description = "Ragnarok 2"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.9"
  # s.add_dependency "jquery-rails"
end
