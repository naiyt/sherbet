# typed: strict

module Sherbet
  module Utilities
    extend T::Sig

    sig do
      params(
        hash: T::Hash[T.any(String, Symbol), T.untyped],
        key: T.any(String, Symbol),
        default: Integer
      ).returns(Integer)
    end
    def self.option_to_integer(hash, key, default)
      is_integer = Integer(hash[key]) rescue false
      is_integer ? Integer(hash[key]) : default
    end

    sig { params(string: String, to_change: Integer).returns(String) }
    def self.obscure(string, to_change=2)
      changed = Set.new

      to_change.times do
        loop do
          pos = rand(0..string.length - 1)
          random_char = rand(65..90).chr

          # Untyped solution, breaks if string[pos] is nil:
          # next if changed.include?(pos) || string[pos] == " " || string[pos].upcase == random_char
          # We know more than the compiler in this case (pos is in range), so we can use T.must:
          next if changed.include?(pos) || string[pos] == " " || T.must(string[pos]).upcase == random_char

          changed.add(pos)
          string[pos] = /[[:upper:]]/.match(string[pos]) ? random_char.upcase : random_char.downcase
          break
        end
      end

      string
    end
  end
end
