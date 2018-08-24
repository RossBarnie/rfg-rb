require 'rfg/config_parser'
module Rfg
  class FileConfigParser < Rfg::ConfigParser
    def initialize(*args, path:)
      if args.length > 0 && args[:raw] != nil
        warn "Unexpected :raw argument to file config parser, overwriting"
      end
      raw = File.read(path)
      super(*args, raw: raw)
    end
  end
end
