module Mendeley
  module API
    def request(sub_url, params = nil)
      request = build_request_url(sub_url ,params)
      JSON.parse(RestClient.get(request))
    end

    def build_request_url(sub_url, params = nil )
      request_url = File.join(self.base_url, sub_url)
      param_string = "?consumer_key=#{Mendeley.consumer_key}"
      if params
        params.each do |key,value|
          param_string << "&#{key}=#{value}"
        end
      end
      request_url.concat(param_string)
    end
    private :build_request_url
    
    #Wrapper for the public /documents/ domain on mendeley
    #see http://apidocs.mendeley.com/home/public-resources
    #All of the following actions will take place on the 
    #documents namespace of the API. 
    #
    #EX// to search all documents for "hello world" you would do 
    #       Mendeley::API::Documents.search("hello world")
    # All Responses will be a ruby hash created by parsing the 
    # response json from the mendeley api
    class Documents
      class << self
        extend API
      end
      @base_url = "http://api.mendeley.com/oapi/documents/"
      def self.base_url
        @base_url
      end

      #Search all documents using the public API for the given term
      def self.search(term)
        self.request(File.join("search", URI.escape(term)))
      end
    end
  end
end
