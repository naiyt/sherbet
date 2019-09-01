# typed: strict

require "set"

module Sherbet
  class Generator
    extend T::Sig

    sig { params(number_generated: Integer).void }
    def run(number_generated=1)
      number_generated.times do
        puts wrapper_emoji * 40
        puts "\n"
        puts info.join("\n\n")
        puts "\n"
        puts wrapper_emoji * 40
      end
    end

    # TODO: interface
    sig { returns(T::Array[String]) }
    def info
      []
    end

    sig { returns(String) }
    def wrapper_emoji
      "*"
    end
  end
end
