#1 The sum of the squares of the first ten natural numbers is 1^2 + 2^2 + ... + 10^2 = 385.
# The square of the sum of the first ten natural numbers is (1 + 2 + ... + 10)^2 = 55^2 = 3025.
# Hence the (absolute value of the) difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 - 385 = 2640.
# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

# First implementation (the long way)

def sum_square_diff(upper = 100)
  sum_of_squares = (1..upper).map { |num| num ** 2}.reduce(:+)
  square_of_sum = ((1..upper).reduce(:+)) ** 2
  (sum_of_squares - square_of_sum).abs  # return the absolute value of the difference
end

p sum_square_diff  # => 25164150
p sum_square_diff(100)  # => 25164150
p sum_square_diff(10)  # => 2640

# Second implementation (using formulae - much faster)

def sum_square_diff2(upper = 100)
  sum_of_squares = (upper * (upper + 1) * ((2 * upper) + 1)) / 6
  square_of_sum = ((upper * (upper + 1)) / 2) ** 2
  (sum_of_squares - square_of_sum).abs  # return the absolute value of the difference
end

p sum_square_diff2  # => 25164150
p sum_square_diff2(100)  # => 25164150
p sum_square_diff2(10)  # => 2640

#2 By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
# What is the 10,001st prime number?

require "prime"
require "benchmark"

p Prime.first(10001).last  # => 104743
p Benchmark.measure { Prime.first(10001).last }  # .0017 seconds

# OR

p Prime.take(10001).last  # => 104743
p Benchmark.measure { Prime.take(10001).last }  # .00017 seconds

#3 The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.

def sum_primes_below(upper)
  (1..upper).select { |num| Prime.prime?(num) }.reduce(:+)
end

p sum_primes_below(200000)  # => 1709600813
p Benchmark.measure { sum_primes_below(200000) }  # .72 seconds
# p sum_primes_below(2000000)  # => 142913828922
# p Benchmark.measure { sum_primes_below(2000000) }  # nearly 15 seconds!
