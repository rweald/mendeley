module Mendeley
  module API
    class Documents
      @base_url = "http://api.mendeley.com/oapi/documents/"
      def self.base_url
        @base_url
      end

      def request(sub_url, params)
        request = build_request_url(sub_url ,params)
        JSON.parse(RestClient.get(request))
      end

      def build_request_url(sub_url, params)
        request_url = File.join(self.class.base_url, sub_url)
        param_string = ""
        params.each do |key,value|
          param_string << "&#{key}=#{value}"
        end
        request_url.concat(param_string)
      end
      private :build_request_url

    end
  end
end
