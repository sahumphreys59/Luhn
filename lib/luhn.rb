module Luhn
  def self.is_valid?(number)
    revnumber = number.to_s.reverse
    split_revnumber = revnumber.split('').map { |digit| digit.to_i }
    split_revnumber.length.times do |n|
      if n.odd?
        split_revnumber[n] *= 2
        if split_revnumber[n] > 9
          split_revnumber[n] -= 9
        end
      end
    end 
    digit_sum = split_revnumber.inject(0){|sum,x| sum + x }
    if digit_sum % 10 == 0
      true
    else 
      false
    end
  end
end

Luhn.is_valid?(4194560385008504)