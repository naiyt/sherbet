require "faker"
require_relative "./generator"

module Sherbet
  class Game < Generator
    def info
      [
        title,
        pitch,
        boxquote
      ]
    end

    def wrapper_emoji
      "🎮"
    end

    private

    def pitch
      "This revolutionary new #{genre} is coming soon to #{platform} and #{platform}!"
    end

    def title
      title = obscure(Faker::Game.title)
      subtitle = obscure(Faker::Game.title)
      subtitle = "The #{subtitle}" unless subtitle.downcase.start_with?("the")
      "#{title}: #{subtitle}"
    end

    def genre(bust_cache=false)
      @genre = nil if bust_cache
      @genre ||= Faker::Game.genre
    end

    def platform
      Faker::Game.platform
    end

    def boxquote
      "\"It's like the #{Faker::Game.title} of #{genre}s!\" - #{Faker::Name.name}"
    end
  end
end
