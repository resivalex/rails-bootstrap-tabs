require 'rails'
require 'action_view'
require 'rails-bootstrap-tabs'

describe RailsBootstrapTabs::Helpers::TabsHelper do
  let(:template) { mock_template }

  describe '#tabs' do
    it 'renders 1 tab' do
      result = template.tabs do |c|
        c.tab('Tab 1') { 'Content 1' }
      end
      expect(result).to eq '<ul class="nav nav-tabs"><li class="active"><a data-toggle="tab" href="#tab-0-mpvaddhj">Tab 1</a></li></ul><div class="tab-content"><div id="tab-0-mpvaddhj" class="tab-pane active">Content 1</div></div>'
    end

    it 'the first readme example' do
      result = template.tabs do |c|
        c.tab 'Tab 1' do
          '<span>Tab content 1</span>'.html_safe
        end
        c.tab 'Tab 2' do
          '<span>Tab content 1</span>'.html_safe
        end
      end
      expect(result).to eq '<ul class="nav nav-tabs"><li class="active"><a data-toggle="tab" href="#tab-0-mpvaddhj">Tab 1</a></li>' + "\n" +
                             '<li><a data-toggle="tab" href="#tab-1-flmijlfp">Tab 2</a></li></ul><div class="tab-content"><div id="tab-0-mpvaddhj" class="tab-pane active"><span>Tab content 1</span></div>' + "\n" +
                             '<div id="tab-1-flmijlfp" class="tab-pane"><span>Tab content 1</span></div></div>'
    end

    it 'the second readme example' do
      result = template.tabs content_class: 'my-padding' do |c|
        c.tab 'Profile', anchor: 'profile', link_class: 'my-custom-class' do
          '<span>Hello, user!</span>'.html_safe
        end
        c.tab 'New feature', anchor: 'new', active: true do
          '<button>Click!</button>'.html_safe
        end
      end
      expect(result).to eq "<ul class=\"nav nav-tabs\"><li><a class=\"my-custom-class\" data-toggle=\"tab\" href=\"#profile\">Profile</a></li>\n" +
                             "<li class=\"active\"><a data-toggle=\"tab\" href=\"#new\">New feature</a></li></ul><div class=\"tab-content my-padding\"><div id=\"profile\" class=\"tab-pane\"><span>Hello, user!</span></div>\n" +
                             "<div id=\"new\" class=\"tab-pane active\"><button>Click!</button></div></div>"
    end

    context 'bootstrap 4' do
      before { RailsBootstrapTabs.bootstrap_version = 4 }
      after { RailsBootstrapTabs.bootstrap_version = 3 }

      it 'bootstrap 4 readme example' do
        result = template.tabs content_class: 'my-padding', fade_effect: true do |c|
          c.tab 'Profile', anchor: 'profile', link_class: 'my-custom-class' do
            '<span>Hello, user!</span>'.html_safe
          end
          c.tab 'New feature', anchor: 'new', active: true do
            '<button>Click!</button>'.html_safe
          end
        end
        expect(result).to eq "<ul class=\"nav nav-tabs\"><li class=\"nav-item\"><a data-toggle=\"tab\" class=\"nav-link my-custom-class\" href=\"#profile\">Profile</a></li>\n" +
                               "<li class=\"nav-item\"><a data-toggle=\"tab\" class=\"nav-link active\" href=\"#new\">New feature</a></li></ul><div class=\"tab-content my-padding\"><div id=\"profile\" class=\"tab-pane fade in\" role=\"tabpanel\"><span>Hello, user!</span></div>\n" +
                               "<div id=\"new\" class=\"tab-pane active fade show\" role=\"tabpanel\"><button>Click!</button></div></div>"
      end
    end
  end
end
