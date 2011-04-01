require "bundler"
Bundler.setup

require "rspec"
require "mocha"
require 'mendeley'

Rspec.configure do |config|
  config.mock_with :mocha
end
