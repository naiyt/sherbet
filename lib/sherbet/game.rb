# typed: strict

require "faker"
require_relative "./generator"

module Sherbet
  class Game < Generator
    extend T::Sig

    sig { void }
    def initialize
      # See https://stackoverflow.com/questions/56693361/how-would-you-do-rose-memoization-with-sorbet
      # We could set the file to typed: true if we don't want to have to instantiate
      # each memoizable instance variable like this.
      @genre = T.let(nil, T.nilable(String))
    end

    sig { returns(T::Array[String]) }
    def info
      [
        title,
        pitch,
        boxquote
      ]
    end

    sig { returns(String) }
    def wrapper_emoji
      "🎮"
    end

    private

    sig { returns(String) }
    def pitch
      "This revolutionary new #{genre} is coming soon to #{platform} and #{platform}!"
    end

    sig { returns(String) }
    def title
      title = Sherbet::Utilities.obscure(Faker::Game.title)
      subtitle = Sherbet::Utilities.obscure(Faker::Game.title)
      subtitle = "The #{subtitle}" unless subtitle.downcase.start_with?("the")
      "#{title}: #{subtitle}"
    end

    sig { params(bust_cache: T::Boolean).returns(String) }
    def genre(bust_cache=false)
      @genre = nil if bust_cache
      @genre ||= Faker::Game.genre
    end

    sig { returns(String) }
    def platform
      Faker::Game.platform
    end

    sig { returns(String) }
    def boxquote
      "\"It's like the #{Faker::Game.title} of #{genre}s!\" - #{Faker::Name.name}"
    end
  end
end
