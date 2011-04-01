require 'spec_helper'

describe "Mendeley" do
  it "should have a version" do
    Mendeley::VERSION.should be
  end

  it "should have a API submodule" do
    Mendeley.constants.include?("API")
  end

  it "should have a consumer key" do
    Mendeley.singleton_methods.include?("consumer_key")
  end

  it "should have nil as the initial consumer key value" do
    Mendeley.consumer_key.should be_nil
  end
end
