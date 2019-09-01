require "thor"
require "sherbet/version"
require "sherbet/startup"
require "sherbet/game"

module Sherbet
  class AbstractMethodError < StandardError; end

  class ThorInterface < Thor
    desc "startup", "generates a startup idea"
    def startup
      Sherbet::Startup.new.run
    end

    desc "game", "generates a new game idea"
    def game
      Sherbet::Game.new.run
    end
  end
end
