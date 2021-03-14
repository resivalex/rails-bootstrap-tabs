module RailsBootstrapTabs::Renderers
  class TabsRenderer
    def initialize(template, *args, &block)
      @template = template
      @args = args || []
      @options = args[0] || {}
      @block = block
      @tabs = []
    end

    def rstr(seed)
      rnd = Random.new(seed)
      (0...8).map { ('a'.ord + rnd.rand(26)).chr }.join
    end

    def render
      @block.call(Context.new(self))
      prepare_tabs
      render_tabs(@tabs) + render_panes(@tabs, @options)
    end

    def prepare_tabs
      @tabs.each.with_index do |tab, index|
        tab.options[:anchor] ||= "tab-#{index}-#{rstr(index)}"
        tab.options[:fade_effect] ||= RailsBootstrapTabs.fade_effect || @options[:fade_effect]
      end
      active_tab = @tabs.find { |t| t.options[:active] }
      active_tab ||= @tabs.first
      @tabs.each { |t| t.options.delete(:active) }
      active_tab.options[:active] = true if active_tab
    end

    def render_tabs(tabs)
      render_tabs_wrapper do
        tabs.map do |tab|
          render_tab(tab) do
            tab.name
          end
        end.join("\n").html_safe
      end
    end

    def render_panes(tabs, options)
      render_panes_wrapper(options) do
        tabs.map do |tab|
          render_pane(tab) do
            tab.block.call if tab.block
          end
        end.join("\n").html_safe
      end
    end

    def render_tabs_wrapper
      raise "Must be redefined"
    end

    def render_tab(tab)
      raise "Must be redefined"
    end

    def render_panes_wrapper(options)
      raise "Must be redefined"
    end

    def render_pane(tab)
      raise "Must be redefined"
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
