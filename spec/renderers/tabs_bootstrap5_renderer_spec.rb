require 'rails'
require 'action_view'
require 'rails-bootstrap-tabs'

describe RailsBootstrapTabs::Renderers::TabsBootstrap5Renderer do
  let(:template) { mock_template }
  let(:renderer) { RailsBootstrapTabs::Renderers::TabsBootstrap5Renderer.new(template) }

  describe '#render_tabs_wrapper' do
    context 'wrapper_markup is nav' do
      let(:renderer) { RailsBootstrapTabs::Renderers::TabsBootstrap5Renderer.new(template, { nav_markup: true } ) }

      it 'renders nav wrapper' do
        expect(renderer.render_tabs_wrapper { '[tabs_content]' }).to eq '<nav><div class="nav nav-tabs" role="tablist">[tabs_content]</div></nav>'
      end
    end

    context 'wrapper_markup is NOT nav' do
      it 'renders ul wrapper' do
        expect(renderer.render_tabs_wrapper { '[tabs_content]' }).to eq '<ul class="nav nav-tabs" role="tablist">[tabs_content]</ul>'
      end
    end
  end

  describe '#render_tab' do
    it 'renders tab' do
      tab = double(options: { anchor: 'anch', link_class: 'lnk', active: true })
      expect(renderer.render_tab(tab) { '[title]' }).to eq '<li class="nav-item" role="presentation"><button name="button" type="submit" data-bs-toggle="tab" data-bs-target="#anch" class="nav-link active lnk" role="tab">[title]</button></li>'
    end
  end

  describe '#render_panes_wrapper' do
    context 'wrapper_markup is nav' do
      it 'renders nav wrapper' do
        tab = double(options: { anchor: 'anch', link_class: 'lnk', active: true, nav_markup: true })
        expect(renderer.render_tab(tab) { '[title]' }).to eq '<button name="button" type="submit" data-bs-toggle="tab" data-bs-target="#anch" class="nav-link active lnk" role="tab">[title]</button>'
      end
    end

    context 'wrapper_markup is NOT nav' do
      it 'renders tab' do
        tab = double(options: { anchor: 'anch', link_class: 'lnk', active: true })
        expect(renderer.render_tab(tab) { '[title]' }).to eq '<li class="nav-item" role="presentation"><button name="button" type="submit" data-bs-toggle="tab" data-bs-target="#anch" class="nav-link active lnk" role="tab">[title]</button></li>'
      end
    end
  end

  describe '#render_pane' do
    it 'renders pane' do
      tab = double(options: { anchor: 'anch', link_class: 'lnk', active: true })
      expect(renderer.render_pane(tab) { '[pane_content]' }).to eq '<div id="anch" class="tab-pane active" role="tabpanel">[pane_content]</div>'
    end
  end
end
