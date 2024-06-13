module RailsBootstrapTabs::Renderers
  class TabsBootstrap5Renderer < TabsRenderer
    def render_tabs_wrapper
      if @options[:nav_markup]
        content_tag :nav do
          content_tag :div, class: 'nav nav-tabs', role: 'tablist' do
            yield
          end
        end
      else
        content_tag :ul, class: 'nav nav-tabs', role: 'tablist' do
          yield
        end
      end
    end

    def render_tab(tab)
      options = tab.options
      link_class = 'nav-link'
      link_class << ' active' if options[:active]
      link_class << " #{options[:link_class]}" if options[:link_class]
      if options[:nav_markup]
        button_tag data: { 'bs-toggle': 'tab', 'bs-target': "##{options[:anchor]}" }, class: link_class, role: 'tab' do
          yield
        end
      else
        content_tag :li, class: 'nav-item', role: 'presentation' do
          button_tag data: { 'bs-toggle': 'tab', 'bs-target': "##{options[:anchor]}" }, class: link_class, role: 'tab' do
            yield
          end
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
      if options[:fade_effect]
        pane_class << ' fade'
        pane_class << ' show' if options[:active]
        pane_class << ' in' unless options[:active]
      end
      content_tag :div, id: options[:anchor].to_s, class: pane_class, role: 'tabpanel' do
        yield
      end
    end
  end
end
