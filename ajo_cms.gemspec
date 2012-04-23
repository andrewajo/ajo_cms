$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ajo_cms/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ajo_cms"
  s.version     = AjoCms::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "AjoCms is a lightweight cms for rails"
  s.description = "Delivers a quick and flexible backend solution for small websites"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.0"
  s.add_dependency "haml"
  s.add_dependency "sass-rails"
  s.add_dependency "bootstrap-sass"
  s.add_dependency "carrierwave"
  s.add_dependency "rmagick"
  s.add_dependency "bcrypt-ruby"
  s.add_dependency "acts_as_list"
  s.add_dependency "fog"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "ruby-debug19"
end
