require 'spec_helper'

describe "Mendeley" do
  it "should have a version" do
    Mendeley::VERSION.should be
  end

  it "should have a API submodule" do
    Mendeley.constants.include?("API")
  end
end
