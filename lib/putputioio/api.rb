module PutPutIoIo
  class Api
    def initialize key, secret
      @key = key
      @secret = secret
      @req_data = {
        'api_key' => @key,
        'api_secret' => @secret,
        'params' => {}
      }
      @url_base = "http://api.put.io/v1/"
    end

    def get res, method, params={}
      data = @req_data.clone
      data['params'] = params


      _param = URI.escape "#{res}?method=#{method}&request=#{data.to_json}"
      uri = URI.parse "#{@url_base}#{_param}"
      http = Net::HTTP.new(uri.host, uri.port)
      response = http.request(Net::HTTP::Get.new(uri.request_uri))

      and_return response.body
    end

    def post res, method, params={}
      data = @req_data.clone
      data['params'] = params
      uri = URI.parse "#{@url_base}#{res}?method=#{method}"
      http = Net::HTTP.new(uri.host, uri.port)

      request = Net::HTTP::Post.new(uri.request_uri)
      request.set_form_data( data )

      response = http.request(request)

      and_return response
    end

    def and_return body
      begin
        JSON.parse body
      rescue
        false
      end
    end
  end
end
