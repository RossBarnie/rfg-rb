require 'net/http'
require 'json'

module Rfg
  class Client
    DEFAULT_HOST = "https://realfavicongenerator.net".freeze
    DEFAULT_GENERATE_PATH = "api/favicon".freeze

    attr_reader :response

    def initialize(host: DEFAULT_HOST)
      @host = host
      @headers = default_headers
      @response = ""
    end

    def generate_favicon(config:, path: DEFAULT_GENERATE_PATH)
      body = config.to_json
      endpoint = "#{@host}/#{path}"
      post(endpoint: endpoint, headers: @headers, body: body)
      self
    end

    private

    def post(endpoint:, headers:, body:)
      uri = URI(endpoint)
      @response = Net::HTTP.post(uri, body, headers)
      self
    end

    def default_headers
      {
        "Content-Type" => "application/json",
      }
    end
  end
end
