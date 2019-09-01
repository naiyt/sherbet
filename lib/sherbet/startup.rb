require "faker"
require_relative "./generator"

module Sherbet
  class Startup < Generator
    def run
      puts company_name
      puts "\n"
      puts tagline
      puts "\n"
      puts "We're expecting a valuation of $#{valuation} and are accepting investors now."
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
      rand(-100_000_000_000..100_000_000_000)
    end
  end
end
