require "spec_helper"
include Mendeley::API

describe "Mendeley" do
  describe "API" do
    describe "Documents" do
      it "should extend all the API module methods" do
        Mendeley::API::Documents.singleton_methods.include?("request").should be_true
      end
      it "should have a base_url" do
        Documents.base_url.should == "http://api.mendeley.com/oapi/documents/"
      end
      
      describe ".build_request_url" do
        it "should return /search/<terms>" do
          Documents.send(:build_request_url, "/search").should == "http://api.mendeley.com/oapi/documents/search?consumer_key="
        end
      end

      describe ".search" do
        it "should search documents for the string for marcio" do
          response = JSON.generate({:result => "success"})
          RestClient.expects(:get).with() do |request| 
            request.should == "http://api.mendeley.com/oapi/documents/search/marcio%20von%20muhlen?consumer_key="
          end.returns(response)
          Documents.search("marcio von muhlen")
        end
      end
    end
  end
end
