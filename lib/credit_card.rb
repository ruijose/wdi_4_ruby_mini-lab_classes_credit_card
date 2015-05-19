class CreditCard
  attr_reader :card_number, :expiration, :verification, :name, :zip_code

  def initialize(card_number, expiration, verification, name, zip_code)
    @card_number = card_number
    @expiration = expiration
    @verification = verification
    @name = name
    @zip_code = zip_code
  end

  def valid?
    !@name.empty? && @zip_code.length == 5 && @card_number.length == 16 && !expired?
  end

  private

  def credit_card_valid?
    digits = @card_number.chars.map(&:to_i)
    check = digits.pop

    sum = digits.reverse.each_slice(2).map do |x, y|
      [(x * 2).divmod(10), y || 0]
    end.flatten.inject(:+)

     (10 - sum % 10) == check
  end

  def expiration_valid?
    (Date.parse(@expiration) - DateTime.now) > 0
  end
end
