require 'net/http'
require 'json'

module Rfg
  class Client
    DEFAULT_ENDPOINT = "https://realfavicongenerator.net/api/favicon".freeze

    def initialize(endpoint: DEFAULT_ENDPOINT)
      @endpoint = endpoint
      @headers = default_headers
    end

    def generate_favicon(config:)
      body = config.to_json
      post(headers: @headers, body: body)
    end

    private

    def post(headers:, body:)
      uri = URI(@endpoint)
      Net::HTTP.post(uri, body, headers)
    end

    def default_headers
      {
        "Accept" => "application/json",
        "Content-Type" => "application/json; charset=UTF-8",
      }
    end
  end
end
