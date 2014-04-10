class Temperature
  attr_reader :temp
  def initialize(args = {})
    @temp = args
  end
  def in_fahrenheit
    puts @temp.keys
  end
end
