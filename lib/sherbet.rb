# typed: strict

require "thor"
require "sorbet-runtime"
require "sherbet/version"
require "sherbet/startup"
require "sherbet/game"
require "sherbet/utilities"

module Sherbet
  class AbstractMethodError < StandardError; end

  class ThorInterface < Thor
    extend T::Sig

    desc "startup", "generates a startup idea"
    method_option :times, aliases: "-t", desc: "number of ideas to generate"
    sig { void }
    def startup
      Sherbet::Startup.new.run(Sherbet::Utilities.option_to_integer(options, :times, 1))
    end

    desc "game", "generates a new game idea"
    method_option :times, aliases: "-t", desc: "number of ideas to generate"
    sig { void }
    def game
      Sherbet::Game.new.run(Sherbet::Utilities.option_to_integer(options, :times, 1))
    end
  end
end
