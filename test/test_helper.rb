require 'rubygems'
require 'bundler/setup'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

ENV["RAILS_ENV"] = "test"

require 'minitest/autorun'
require 'rails'
require 'action_controller'
require 'action_view'
require 'rails/test_help'
require 'bootstrap-form'
require 'rr'

module BootstrapForm
  class Application < Rails::Application ; end
end

BootstrapForm::Application.routes.draw do
  get '/:controller(/:action(/:id))'
end
BootstrapForm::Application.config.secret_key_base = 'bootstrap'

ActionController::Base.send :include, BootstrapForm::Application.routes.url_helpers
