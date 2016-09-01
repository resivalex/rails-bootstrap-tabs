$:.push File.expand_path("../lib", __FILE__)

require 'rails-bootstrap-tabs/version'

Gem::Specification.new do |s|
  s.name        = 'rails-bootstrap-tabs'
  s.version     = RailsBootstrapTabs::VERSION
  s.authors     = ['Ivan Reshetnikov']
  s.email       = ['resivalex@gmail.com']
  s.homepage    = 'https://github.com/resivalex/rails-bootstrap-tabs'
  s.summary     = 'A Rails plugin to build bootstrap tabs'
  s.description = s.summary
  s.license     = 'MIT'

  s.files = Dir["{app,config,db,lib}/**/*"] + ['MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '>= 3.2.11'
end
