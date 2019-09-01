# typed: strict

require "thor"
require "sorbet-runtime"
require "sherbet/version"
require "sherbet/startup"
require "sherbet/game"
require "sherbet/utilities"

module Sherbet
  class ThorInterface < Thor
    extend T::Sig

    desc "startup", "generates a startup idea"
    method_option :times, aliases: "-t", desc: "number of ideas to generate"
    sig { void }
    def startup
      # Now that Generator is abstract, this will be a runtime error:
      # Sherbet::Generator.new
      Sherbet::Startup.new.run(Sherbet::Utilities.option_to_integer(options, :times, 1))
    end

    desc "game", "generates a new game idea"
    method_option :times, aliases: "-t", desc: "number of ideas to generate"
    sig { void }
    def game
      # This doesn't match the type signature of run, so it will be a type error:
      # Sherbet::Game.new.run
      Sherbet::Game.new.run(Sherbet::Utilities.option_to_integer(options, :times, 1))
    end
  end
end
