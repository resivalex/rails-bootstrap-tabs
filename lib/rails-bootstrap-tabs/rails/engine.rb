require 'rails-bootstrap-tabs/helpers/tabs_helper'

module RailsBootstrapTabs
  module Rails
    class Engine < ::Rails::Engine
      initializer "rails-bootstrap-tabs" do
        ActionView::Base.send :include, RailsBootstrapTabs::Helpers::TabsHelper
      end
    end
  end
end
