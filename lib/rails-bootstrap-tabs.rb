module RailsBootstrapTabs
  module Renderers
    autoload :TabsRenderer, 'rails-bootstrap-tabs/renderers/tabs_renderer'
    autoload :TabsBootstrap3Renderer, 'rails-bootstrap-tabs/renderers/tabs_bootstrap3_renderer'
    autoload :TabsBootstrap4Renderer, 'rails-bootstrap-tabs/renderers/tabs_bootstrap4_renderer'
  end
end

require 'rails-bootstrap-tabs/rails/engine'
