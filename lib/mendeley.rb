require 'yajl/json_gem'
require 'mendeley/public_api'
module Mendeley
  #Setup the consumer_key that will be used for all public api requests
  class << self
    attr_accessor :consumer_key
  end
end
