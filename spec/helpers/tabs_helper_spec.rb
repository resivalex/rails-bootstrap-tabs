require 'rails'
require 'action_view'
require 'rails-bootstrap-tabs'

describe RailsBootstrapTabs::Helpers::TabsHelper do
  let(:template) do
    double(:template)
  end

  describe '#tabs' do
    it 'renders tabs' do
      template.extend(RailsBootstrapTabs::Helpers::TabsHelper)
      template.should_receive(:content_tag).with(:ul, class: 'nav nav-tabs') { '[tabs_wrapper]' }
      template.should_receive(:content_tag).with(:div, class: 'tab-content') { '[panes_wrapper]' }
      result = template.tabs({}) do |c|
        c.tab('Tab 1') { 'Content 1' }
      end
      expect(result).to eq '[tabs_wrapper][panes_wrapper]'
    end
  end
end
