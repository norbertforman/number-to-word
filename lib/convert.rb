# Will convert a number into a word
class Convert
  def initialize
    vocabulary = Vocabulary.new
    @number_words_hash = vocabulary.language('en')
  end

  def to_word(number)
    @number_words_hash[number] if @number_words_hash.has_key?(number)
  end
end
