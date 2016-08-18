class MissingNumberError < StandardError
  attr_reader :message

  def initialize(message = "We do not support the conversion of this number")
    super
    @message = message
  end
end
