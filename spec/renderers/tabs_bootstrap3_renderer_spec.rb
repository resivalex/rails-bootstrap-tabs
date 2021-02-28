require 'rails'
require 'action_view'
require 'rails-bootstrap-tabs'

describe RailsBootstrapTabs::Renderers::TabsBootstrap3Renderer do
  let(:template) do
    double(:template)
  end
  let(:renderer) { RailsBootstrapTabs::Renderers::TabsBootstrap3Renderer.new(template) }

  describe '#render_tabs_wrapper' do
    it 'renders wrapper' do
      template.should_receive(:content_tag).with(:ul, class: 'nav nav-tabs')
      renderer.render_tabs_wrapper
    end
  end

  describe '#render_tab' do
    it 'renders tab' do
      tab = double(options: { anchor: 'anch', link_class: 'lnk', active: true })
      template.should_receive(:content_tag).with(:li, class: 'active')
      renderer.render_tab(tab)
    end
  end

  describe '#render_panes_wrapper' do
    it 'renders panes wrapper' do
      template.should_receive(:content_tag).with(:div, class: 'tab-content cnt')
      renderer.render_panes_wrapper(content_class: 'cnt')
    end
  end

  describe '#render_pane' do
    it 'renders pane' do
      tab = double(options: { anchor: 'anch', link_class: 'lnk', active: true })
      template.should_receive(:content_tag).with(:div, id: 'anch', class: 'tab-pane active')
      renderer.render_pane(tab)
    end
  end
end
