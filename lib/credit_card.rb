require 'time'

class CreditCard
  def initialize(number, date, ccv, name, zip_code)
    @number = number
    @date = date
    @ccv = ccv
    @name = name
    @zip_code = zip_code
  end

  def valid?
    has_name? && check_zip_code && check_card_number && valid_date?
  end

  private
  def has_name?
   !@name.empty? 
  end

  def check_zip_code
    @zip_code.to_s.chars.count == 5
  end

  def check_card_number
    @number.to_s.chars.count == 16 
  end

  def valid_date?
    date = Time.parse(@date)
    date > Time.now
  end
end
