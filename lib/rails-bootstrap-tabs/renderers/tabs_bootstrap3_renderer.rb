module RailsBootstrapTabs::Renderers
  class TabsBootstrap3Renderer < TabsRenderer
    def render_tabs_wrapper
      content_tag :ul, class: 'nav nav-tabs' do
        yield
      end
    end

    def render_tab(tab)
      options = tab.options
      content_tag :li, class: ('active' if options[:active]) do
        link_to "##{options[:anchor]}", data: { toggle: 'tab' } do
          yield
        end
      end
    end

    def render_panes_wrapper(options)
      content_class = 'tab-content'
      content_class << " #{options[:content_class]}" if options[:content_class]

      content_tag :div, class: content_class do
        yield
      end
    end

    def render_pane(tab)
      options = tab.options
      pane_class = 'tab-pane'
      pane_class << ' active' if options[:active]
      content_tag :div, id: options[:anchor].to_s, class: pane_class do
        yield
      end
    end
  end
end
