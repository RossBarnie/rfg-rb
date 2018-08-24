module Rfg
  class ConfigParser
    # DEFAULT_CONFIG = {
    #   "favicon_generation": {
    #     "masterPicture": {
    #       "type": "url",
    #       "url": "example/favicon.png",
    #     },
    #     "files_location": {
    #       "type": "root",
    #     },
    #     "design": {
    #       "desktopBrowser": {},
    #       "ios": {
    #         "pictureAspect": "noChange"
    #       },
    #       "windows": {
    #         "pictureAspect": "noChange",
    #         "backgroundColor": "#da532c",
    #         "onConflict": "override"
    #       },
    #       "androidChrome": {
    #         "pictureAspect": "noChange",
    #         "themeColor": "#ffffff",
    #         "manifest": {
    #           "name": "TestApp",
    #           "display": "browser",
    #           "orientation": "notSet",
    #           "onConflict": "override"
    #         }
    #       },
    #       "safariPinnedTab": {
    #         "pictureAspect": "silhouette",
    #         "themeColor": "#5bbad5"
    #       }
    #     },
    #     "settings": {
    #       "scalingAlgorithm": "Mitchell",
    #       "errorOnImageTooSmall": false
    #     }
    #   }
    # }

    attr_reader :config

    def initialize(raw:, parser: JSON)
      @raw = raw.freeze
      @parser = parser
      @config = ""
    end

    def parse
      @config = @parser.parse(@raw)
      self
    end

    def to_json
      @config.to_json
    end
  end
end
