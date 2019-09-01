require "thor"
require "sherbet/version"
require "sherbet/startup"

module Sherbet
  class AbstractMethodError < StandardError; end

  class ThorInterface < Thor
    desc "startup", "generates a startup idea"
    def startup
      Sherbet::Startup.new.run
    end
  end
end
