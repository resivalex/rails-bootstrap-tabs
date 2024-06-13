require 'rails'
require 'action_view'
require 'rails-bootstrap-tabs'

describe RailsBootstrapTabs::Renderers::TabsBootstrap3Renderer do
  let(:template) { mock_template }
  let(:args) { { nav_attributes: { 'aria-label': 'Accessibility' } } }
  let(:renderer) { RailsBootstrapTabs::Renderers::TabsBootstrap3Renderer.new(template, args) }

  describe '#render_tabs_wrapper' do
    it 'renders wrapper' do
      expect(renderer.render_tabs_wrapper { '[tabs_content]' }).to eq '<ul class="nav nav-tabs" aria-label="Accessibility">[tabs_content]</ul>'
    end
  end

  describe '#render_tab' do
    it 'renders tab' do
      tab = double(options: { anchor: 'anch', link_class: 'lnk', active: true })
      expect(renderer.render_tab(tab) { '[title]' }).to eq '<li class="active"><a class="lnk" data-toggle="tab" href="#anch">[title]</a></li>'
    end
  end

  describe '#render_panes_wrapper' do
    it 'renders panes wrapper' do
      expect(renderer.render_panes_wrapper(content_class: 'cnt') { '[panes]' }).to eq '<div class="tab-content cnt">[panes]</div>'
    end
  end

  describe '#render_pane' do
    it 'renders pane' do
      tab = double(options: { anchor: 'anch', link_class: 'lnk', active: true })
      expect(renderer.render_pane(tab) { '[pane_content]' }).to eq '<div id="anch" class="tab-pane active">[pane_content]</div>'
    end
  end
end
