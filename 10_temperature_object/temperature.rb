class Temperature
  attr_accessor :c_temp, :f_temp
  @@temp = 0
  @@degree = {}
  def initialize(args = {})
    @f_temp = args if args[:f]
    @c_temp = args if args[:c]
  end
  def in_fahrenheit
    temp = if @f_temp
      @f_temp[:f]
    else
      @c_temp[:c] * 1.8 + 32
    end
  end
  def in_celsius
    temp = if @f_temp
      ((@f_temp[:f] - 32) / 1.8).ceil
    else
      @c_temp[:c]
    end
  end
  def self.from_celsius(number)
    @@temp = number
    @@degree[:c] = true
    @@degree[:f] = nil
    self
  end
  def self.in_celsius
    if @@degree[:c]
      @@temp
    else
      ((@@temp - 32) / 1.8).ceil
    end
  end
  def self.in_fahrenheit
    if @@degree[:f]
      @@temp
    else
      @@temp * 1.8 + 32 if @@temp
    end
  end
  def self.from_fahrenheit(number)
    @@temp = number
    @@degree[:f] = true
    @@degree[:c] = nil
    self
  end
end
class Celsius < Temperature
  attr_accessor :temp
  def initialize(number)
    @temp = number
  end
end