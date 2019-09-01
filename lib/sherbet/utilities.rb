module Sherbet
  module Utilities
    def self.option_to_integer(hash, key, default)
      is_integer = Integer(hash[key]) rescue false
      is_integer ? Integer(hash[key]) : default
    end

    def self.obscure(string, to_change=2)
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
