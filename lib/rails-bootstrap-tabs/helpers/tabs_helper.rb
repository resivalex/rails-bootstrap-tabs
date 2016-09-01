module RailsBootstrapTabs::Helpers
  module TabsHelper
    def tabs(*args, &block)
      RailsBootstrapTabs::Renderers::TabsRenderer.new(self, *args, &block).render
    end
  end
end
