#1

# The sum of the squares of the first ten natural numbers is 1^2 + 2^2 + ... + 10^2 = 385.

# The square of the sum of the first ten natural numbers is (1 + 2 + ... + 10)^2 = 55^2 = 3025.

# Hence the (absolute value of the) difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 - 385 = 2640.

# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

# First implementation - the long way

def sum_square_diff(upper = 100)
  sum_of_squares = (1..upper).map { |num| num ** 2}.reduce(:+)
  p sum_of_squares
  square_of_sum = ((1..upper).reduce(:+)) ** 2
  p square_of_sum
  (sum_of_squares - square_of_sum).abs  # return the absolute value of the difference
end

p sum_square_diff
p sum_square_diff(100)
p sum_square_diff(10)

