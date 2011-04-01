require "bundler"
Bundler.setup

require "rspec"
require "mocha"

Rspec.configure do |config|
  config.mock_with :mocha
end
