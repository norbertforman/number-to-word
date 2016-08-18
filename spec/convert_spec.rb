require 'helper_spec'

describe Convert do
  describe "Convert ones to words" do
    it "Valid ones" do
      convert = Convert.new()
      expect(convert.to_word(1)).to eq 'one'
      expect(convert.to_word(5)).to eq 'five'
      expect(convert.to_word(8)).to eq 'eight'
    end
  end

  describe "Convert tens to words" do
    it "Valid tens" do
      convert = Convert.new()
      expect(convert.to_word(10)).to eq 'ten'
      expect(convert.to_word(14)).to eq 'fourteen'
      expect(convert.to_word(88)).to eq 'eighty-eight'
    end
  end

  describe "Convert hundreds to words" do
    it "Valid hundreds" do
      convert = Convert.new()
      expect(convert.to_word(100)).to eq 'one hundred'
      expect(convert.to_word(711)).to eq 'seven hundred and eleven'
      expect(convert.to_word(567)).to eq 'five hundred and sixty-seven'
    end
  end

  describe "Convert thousands to words" do
    it "Valid thousands" do
      convert = Convert.new()
      expect(convert.to_word(1000)).to eq 'one thousand'
      expect(convert.to_word(4011)).to eq 'four thousand and eleven'
      expect(convert.to_word(9378)).to eq 'nine thousand three hundred and seventy-eight'
    end
  end

  describe "Convert ten thousands to words" do
    it "Valid thousands" do
      convert = Convert.new()
      expect(convert.to_word(10000)).to eq 'ten thousand'
      expect(convert.to_word(47050)).to eq 'forty-seven thousand and fifty'
      expect(convert.to_word(12651)).to eq 'twelve thousand six hundred and fifty-one'
    end
  end

  describe "Convert one hundred thousand to words" do
    it "Valid one hundred thousand" do
      convert = Convert.new()
      expect(convert.to_word(244450)).to eq 'two hundred and forty-four thousand four hundred and fifty'
      expect(convert.to_word(704150)).to eq 'seven hundred and four thousand one hundred and fifty'
      expect(convert.to_word(900101)).to eq 'nine hundred thousand one hundred and one'
      expect(convert.to_word(300001)).to eq 'three hundred thousand and one'
    end
  end

  describe "Convert millions to words" do
    it "Valid millions" do
      convert = Convert.new()
      expect(convert.to_word(1960101)).to eq 'one million nine hundred and sixty thousand one hundred and one'
      expect(convert.to_word(1240101)).to eq 'one million two hundred and forty thousand one hundred and one'
      expect(convert.to_word(9000011)).to eq 'nine million and eleven'
    end
  end

  describe "Convert invalid number" do
    it "Negative number" do
      convert = Convert.new()
      expect{ convert.to_word(-12) }.to raise_error(MissingNumberError)
    end
    it "Large number" do
      convert = Convert.new()
      expect{ convert.to_word(223421234553) }.to raise_error(MissingNumberError)
    end
  end
end
