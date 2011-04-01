require "spec_helper"
include Mendeley::API
describe "Mendeley" do
  describe "API" do
    describe "Documents" do
      it "should have a base_url" do
        Documents.base_url.should == "http://api.mendeley.com/oapi/documents/"
      end
    end
  end
end
