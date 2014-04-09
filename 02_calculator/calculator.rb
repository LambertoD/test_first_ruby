def add(a, b)
  a + b
end
def subtract(a, b)
  a - b
end
def sum( a )
  a.inject(0) {|sum, x| sum += x }
end
def multiply(*numbers)
  numbers.inject(1, &:*)
end
def power(n,p)
  n**p
end
def factorial(n) 
  return 1 if n == 0
  n * factorial(n-1)
end
