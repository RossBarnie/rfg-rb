require 'thor'
require 'json'
require 'rfg'
require 'rfg/response_formatters/cli'

module Rfg
  class Cli < Thor

    # Ensure command reports failure correctly
    def self.exit_on_failure?
      true
    end

    desc "configtest", "Parses the input and prints it to STDOUT"
    method_option :file, aliases: "-f", type: :string, required: false
    def configtest
      if options.length > 0 && options[:file] != nil
        config_parser = Rfg::FileConfigParser.new(path: options[:file])
      else
        config_parser = Rfg::ConfigParser.new(raw: STDIN.read)
      end
      config = config_parser.parse.config
      puts JSON.pretty_generate(config)
    end

    desc "generate", "Generates favicons according to given config"
    method_option :file, aliases: "-f", type: :string, required: false
    def generate
      client = Rfg::Client.new
      if options.length > 0 && options[:file] != nil
        config_parser = Rfg::FileConfigParser.new(path: options[:file])
      else
        config_parser = Rfg::ConfigParser.new(raw: STDIN.read)
      end

      config = config_parser.parse.config
      response = client.generate_favicon(config: config.to_json).response
      formatter = Rfg::ResponseFormatters::Cli.new(response: response)
      puts formatter.summary
      exit 1 unless formatter.success?
    end
  end
end

