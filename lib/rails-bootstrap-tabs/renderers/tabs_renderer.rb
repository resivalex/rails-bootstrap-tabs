module RailsBootstrapTabs::Renderers
  class TabsRenderer
    def initialize(template, *args, &block)
      @template = template
      @args = args || []
      @options = args[0] || {}
      @block = block
      @tabs = []
    end

    def rstr
      (0...8).map { ('a'.ord + rand(26)).chr }.join
    end

    def render
      @block.call(Context.new(self))
      prepare_tabs
      render_tabs(@tabs) + render_panes(@tabs, @options)
    end

    def prepare_tabs
      @tabs.each.with_index do |tab, index|
        tab.options[:anchor] ||= "tab-#{index}-#{rstr}"
      end
      active_tab = @tabs.find { |t| t.options[:active] }
      active_tab ||= @tabs.first
      @tabs.each { |t| t.options.delete(:active) }
      active_tab.options[:active] = true if active_tab
    end

    def render_tabs(tabs)
      content_tag :ul, class: 'nav nav-tabs' do
        tabs.map do |tab|
          options = tab.options
          content_tag :li, class: ('active' if options[:active]) do
            link_to tab.name, "##{options[:anchor]}", data: { toggle: 'tab' }
          end
        end.join("\n").html_safe
      end
    end

    def render_panes(tabs, options)
      content_class = 'tab-content'
      content_class << " #{options[:content_class]}" if options[:content_class]

      content_tag :div, class: content_class do
        tabs.map do |tab|
          options = tab.options
          pane_class = 'tab-pane'
          pane_class << ' active' if options[:active]
          content_tag :div, id: options[:anchor].to_s, class: pane_class do
            tab.block.call if tab.block
          end
        end.join("\n").html_safe
      end
    end

    def tab(name, options, &block)
      @tabs << Tab.new(name, options, block)
    end

    class Context
      include ActionView::Helpers::TagHelper

      def initialize(renderer)
        @renderer = renderer
      end

      def tab(name, options = {}, &block)
        @renderer.tab(name, options, &block)
      end
    end

    def method_missing(*args, &block)
      @template.send(*args, &block)
    end

    Tab = Struct.new(:name, :options, :block)
  end
end
