describe "Mendeley" do
  before(:each) do
    include Mendeley
    #include API
  end
  describe "API" do
    describe "Documents" do
      it "should have a base_url" do
        Mendeley::API::Documents.base_url.should == "http://api.mendeley.com/oapi/documents/"
      end
    end
  end
end
