# typed: strict

require "faker"
require_relative "./generator"

module Sherbet
  class Startup < Generator
    extend T::Sig

    sig { returns(T::Array[String]) }
    def info
      [
        company_name,
        tagline,
        valuation
      ]
    end

    sig { returns(String) }
    def wrapper_emoji
      "💵"
    end

    private

    sig { returns(String) }
    def company_name
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
