# frozen_string_literal: true

# Validates credit card number using Luhn Algorithm
module LuhnValidator
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct

  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)
    sum = 0
    nums_a.reverse.each_with_index do |num, i|
      sum += if i.odd?
               (num * 2 > 9 ? num * 2 - 9 : num * 2)
             else
               num
             end
    end
    (sum % 10).zero?
  end
end
