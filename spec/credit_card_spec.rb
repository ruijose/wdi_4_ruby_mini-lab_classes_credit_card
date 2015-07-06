require_relative '../lib/credit_card'

describe CreditCard do
  describe "#valid_card" do
    it "should be valid" do
      credit_card = CreditCard.new(1212123445123456,
                                   "16-01-16",
                                   321,
                                   "rui mangas pereira",
                                   12321)
      credit_card.valid?.should eql(true)
    end

    it "should be invalid: expiration date in the past" do
      credit_card = CreditCard.new(121215123456,
                                   "12-01-11",
                                   321,
                                   "rui mangas pereira",
                                   12321)
      credit_card.valid?.should eql(false)
    end

    it "should be valid" do
      credit_card = CreditCard.new(1212123445123456,
                                   "15-11-16",
                                   321,
                                   "pedro mangas pereira",
                                   12321)
      credit_card.valid?.should eql(true)
    end

    it "should be invalid: invalid digit length" do
      credit_card = CreditCard.new(12121234451456,
                                   "19-01-11",
                                   321,
                                   "rui mangas pereira",
                                   12321)
      credit_card.valid?.should eql(false)
    end

    it "should be invalid: name not present" do
      credit_card = CreditCard.new(12121234451456,
                                   "19-01-11",
                                   321,
                                   "",
                                   12321)
      credit_card.valid?.should eql(false)
    end
  end
end
