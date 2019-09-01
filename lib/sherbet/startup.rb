require "faker"
require_relative "./generator"

module Sherbet
  class Startup < Generator
    def info
      [
        company_name,
        tagline,
        valuation
      ]
    end

    def wrapper_emoji
      "💵"
    end

    private

    def company_name
      Faker::Books::Lovecraft.deity + " " + %w[
        Industries
        Technologies
        Incorporated
        Software
        Soft
      ].sample
    end

    def tagline
      "We are a #{Faker::Company.buzzword} company in the #{Faker::Company.industry} industry, and we're here to #{Faker::Company.bs} and change the world!"
    end

    def valuation
      price = rand(-100_000_000_000..100_000_000_000)
      "We're expecting a valuation of $#{price} and are accepting investors now."
    end
  end
end
