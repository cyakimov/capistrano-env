$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'capistrano'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../dummy/config/environment',  __FILE__)
require 'rspec/rails'
require 'capistrano-env'

RSpec.configure do |_config|
end