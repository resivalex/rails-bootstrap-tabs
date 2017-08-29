module RailsBootstrapTabs::Helpers
  module TabsHelper
    def tabs(*args, &block)
      tabs_renderer_class = if RailsBootstrapTabs.bootstrap_version == 3
                              RailsBootstrapTabs::Renderers::TabsBootstrap3Renderer
                            elsif RailsBootstrapTabs.bootstrap_version == 4
                              RailsBootstrapTabs::Renderers::TabsBootstrap4Renderer
                            else
                              raise "Unknown bootstrap version: #{RailsBootstrapTabs.bootstrap_version}!"
                            end
      tabs_renderer_class.new(self, *args, &block).render
    end
  end
end
