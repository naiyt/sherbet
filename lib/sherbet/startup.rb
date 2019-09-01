# typed: strict

require "faker"
require_relative "./generator"

module Sherbet
  class Startup < Generator
    extend T::Sig

    sig { implementation.returns(T::Array[String]) }
    def info
      [
        company_name,
        tagline,
        valuation
      ]
    end

    sig { implementation.returns(String) }
    def wrapper_emoji
      "💵"
    end

    # This will be a type error, because we didn't implement the abstract method correctly
    # sig { implementation.returns(Integer) }
    # def wrapper_emoji
    #   1
    # end

    private

    sig { returns(String) }
    def company_name
      # This will be a type error, because Faker::Books::LordOfTheRings
      # does not exist:
      # Faker::Books::LordOfTheRings.character
      Faker::Books::Lovecraft.deity + " " + %w[
        Industries
        Technologies
        Incorporated
        Software
        Soft
      ].sample
    end

    sig { returns(String) }
    def tagline
      "We are a #{Faker::Company.buzzword} company in the #{Faker::Company.industry} industry, and we're here to #{Faker::Company.bs} and change the world!"
    end

    sig { returns(String) }
    def valuation
      price = rand(-100_000_000_000..100_000_000_000)
      "We're expecting a valuation of $#{price} and are accepting investors now."
    end
  end
end
