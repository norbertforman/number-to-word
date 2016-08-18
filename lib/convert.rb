# Will convert a number into a word
class Convert
  def initialize
    vocabulary = Vocabulary.new
    @number_words_hash = vocabulary.language('en')
  end

  def to_word(number)
    raise MissingNumberError if number < 0 || number > 9999999
    value = ''
    value = build(value, number / 1000000, 'million')
    value = build(value, (number / 100000) % 10, 'hundred')
    thousand = (number / 1000) % 100
    value = value + ' and' if value.length > 0 && thousand != 0
    value = build(value, thousand, 'thousand')
    value = value + ' thousand' if value.length > 0 &&
      !value.include?('thousand') && value.include?('hundred')
    value = build(value, (number % 1000) / 100, 'hundred')
    tens = number % 100
    value = value + ' and' if value.length > 0 && tens != 0
    value = build(value, tens, '')
    value.strip
  end

  private

  def build(value, number, text)
    value = value + " #{word(number)} #{text}" if number != 0
    return value
  end

  def word(number)
    return @number_words_hash[number] if @number_words_hash.has_key?(number)
    tens = ((number % 100) / 10) * 10
    ones = number % 10
    if @number_words_hash.has_key?(tens) && @number_words_hash.has_key?(ones)
      return "#{@number_words_hash[tens]}-#{@number_words_hash[ones]}"
    else
      raise MissingNumberError
    end
  end
end
