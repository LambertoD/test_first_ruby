class Array
  def sum
    return 0 if self.empty?
    self.inject(0,&:+)
  end
  def square
    return self if self.empty?
    self.map {|element| element * element }
  end
  def square!
    self.map! {|element| element * element }
  end
end