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

      describe ".authored_by" do
        it "should search for document with a given author" do
          response = JSON.generate({:result => "success"})
          RestClient.expects(:get).with() do |request| 
            request.should == "http://api.mendeley.com/oapi/documents/authored/marcio%20von%20muhlen?consumer_key="
          end.returns(response)
          Documents.authored_by("marcio von muhlen")
        end
      end

      describe ".document_details" do
        it "should return the details of a document do" do
          response = JSON.generate({:result => "success"})
          RestClient.expects(:get).with() do |request| 
            request.should == "http://api.mendeley.com/oapi/documents/details/15?consumer_key="
          end.returns(response)
          Documents.document_details("15")
        end

        it "should throw an exception if the id is not a string" do
          lambda{Documents.document_details(15)}.should raise_error
        end
      end

    end
  end
end
