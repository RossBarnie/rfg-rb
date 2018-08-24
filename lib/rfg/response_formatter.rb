module Rfg
  class ResponseFormatter
    def initialize(response:)
      @response = response
      @result = JSON.parse(response.body, symbolize_names: true)[:favicon_generation_result][:result]
    end

    def summary
      raise "Not implemented error"
    end

    def success?
      (200..299).include? @response.code
    end

    protected

    def error_message
      @result[:error_message]
    end
  end
end
