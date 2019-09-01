require "set"

module Sherbet
  class Generator
    def run(number_generated=1)
      number_generated.times do
        puts wrapper_emoji * 40
        puts "\n"
        puts info.join("\n\n")
        puts "\n"
        puts wrapper_emoji * 40
      end
    end

    def info
      []
    end

    def wrapper_emoji
      "*"
    end
  end
end
