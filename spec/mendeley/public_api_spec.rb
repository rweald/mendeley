require "spec_helper"
include Mendeley::API

describe "Mendeley" do
  describe "API" do
    describe "Documents" do
      it "should have a base_url" do
        Documents.base_url.should == "http://api.mendeley.com/oapi/documents/"
      end
      
      describe "#build_request_url" do
        it "should return /search/<terms>" do
          Documents.send(:build_request_url, "/search").should == "http://api.mendeley.com/oapi/documents/search?consumer_key="
          
        end
      end
    end
  end
end
