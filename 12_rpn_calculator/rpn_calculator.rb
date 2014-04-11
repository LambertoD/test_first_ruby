class RPNCalculator
  attr_accessor :value
  def initialize
    @contents = Array.new(0)
    @value = 0
  end
  def push(number)
    @contents.push(number) 
  end
  def plus
    first_value, second_value = get_input_values_for_expression
    @value = first_value + second_value
  end
  def minus
    first_value, second_value = get_input_values_for_expression
    @value = first_value - second_value
  end
  def divide
    first_value, second_value = get_input_values_for_expression
    @value = first_value.to_f / second_value.to_f
  end
  def times
    first_value, second_value = get_input_values_for_expression
    @value = first_value * second_value
  end
  def tokens(string_expression)
    string_expression.split.map { |s|
      if s.match(/[^\d]/)
        s = s.to_sym
      else
        s = s.to_i
      end
      s
    }.flatten
  end
  def evaluate(string_expression)
    prev_element = nil
    tokens(string_expression).each do |element|
      if prev_element.is_a? Symbol
        @contents.push(@value)
      end
      if element.is_a? Integer
        push(element)
      else
        operand = get_operand(element)
        self.send(operand)
      end
      prev_element = element
    end
    @value
  end

  private
  def get_input_values_for_expression     
    raise "calculator is empty" if @contents.empty?
    first_value = second_value = 0
    second_value = @contents.pop
    if @contents.empty?
      first_value = @value
    else
      first_value = @contents.pop
    end
    return first_value,second_value
  end
  def get_operand(operand)
    operand = case operand
    when :+
      :plus
    when :-
      :minus
    when :*
      :times
    when :/
      :divide
    else 
      raise "invalid entry for mathematical operation"
    end
  end
end