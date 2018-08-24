require 'rfg/response_formatter'

module Rfg
  module ResponseFormatters
    class Cli < ResponseFormatter

      def summary
        if success?
          @response.body
        else
          "#{@response.code} error: #{error_message}"
        end
      end
    end
  end
end
