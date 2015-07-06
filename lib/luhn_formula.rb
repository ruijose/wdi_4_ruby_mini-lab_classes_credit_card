class LuhnFormula
  def self.checksum(credit_card_number)
    digits = credit_card_number.chars.map(&:to_i) 
    result = digits.reverse.each_with_index.map do |value,index|
      index.even? ? value *= 2 : value
      value > 9 ? value = value.to_s.chars.map(&:to_i).inject(:+) : value
    end
    (result.inject(:+) * 9).to_s.chars.last.to_i
  end
end

# puts LuhnFormula.checksum("7992739871") # 3
# puts LuhnFormula.checksum("456") # 4
# puts LuhnFormula.checksum("123") # 0
# puts LuhnFormula.checksum("1234567") # 4
# puts LuhnFormula.checksum("1324567") # 5
