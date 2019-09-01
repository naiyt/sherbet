require "set"

module Sherbet
  class Generator
    def run
      puts wrapper_emoji * 40
      puts "\n"
      puts info.join("\n\n")
      puts "\n"
      puts wrapper_emoji * 40
    end

    def info
      []
    end

    def wrapper_emoji
      "*"
    end

    def obscure(string, to_change=2)
      changed = Set.new

      to_change.times do
        loop do
          pos = rand(0..string.length - 1)
          random_char = rand(65..90).chr
          next if changed.include?(pos) || string[pos] == " " || string[pos].upcase == random_char

          changed.add(pos)
          string[pos] = /[[:upper:]]/.match(string[pos]) ? random_char.upcase : random_char.downcase
          break
        end
      end

      string
    end
  end
end
