require 'rails-bootstrap-tabs/helpers/tabs_helper'

module RailsBootstrapTabs
  mattr_accessor :bootstrap_version do; 3; end
  mattr_accessor :fade_effect do; false; end

  module Rails
    class Engine < ::Rails::Engine
      initializer "rails-bootstrap-tabs" do
        ActionView::Base.send :include, RailsBootstrapTabs::Helpers::TabsHelper
      end
    end
  end
end
