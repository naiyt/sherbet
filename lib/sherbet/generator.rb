# typed: strict

require "set"

module Sherbet
  class Generator
    extend T::Sig
    extend T::Helpers
    abstract!

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

    sig { abstract.returns(T::Array[String]) }
    def info; end

    sig { abstract.returns(String) }
    def wrapper_emoji; end
  end
end
