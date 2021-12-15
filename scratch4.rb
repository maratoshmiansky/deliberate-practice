# num = 36

# p (1..num).map { |n| (1..n).sum }  # output all triangular numbers (i.e., all sums 1 + 2 + ... + n) up to num

# sum_to_num = (1..num).sum
# p sum_to_num

# ~~~

# The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:

# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

# Let us list the factors of the first seven triangle numbers:

#  1: 1
#  3: 1,3
#  6: 1,2,3,6
# 10: 1,2,5,10
# 15: 1,3,5,15
# 21: 1,3,7,21
# 28: 1,2,4,7,14,28
# We can see that 28 is the first triangle number to have over five divisors.

# What is the value of the first triangle number to have over five hundred divisors?

def factors(number)
  (1..number).map { |n| number / n if number % n == 0 }.compact.reverse  # return all factors of number as an array
end

# def factors2(number)
#   (1..number).map do |n|
#     quot, rem = number.divmod(n)
#     quot if rem.zero?
#   end.compact.reverse  # return all factors of number as an array
# end

require 'benchmark'

# p Benchmark.measure { p factors(1234567) }  # => .117 seconds
# p Benchmark.measure { p factors2(1234567) }  # => .204 seconds

def tri_with_factors(n)
  return "please use a positive integer" if n < 1 or n.class != Integer
  num = 1
  tri_factors = [1]

  while tri_factors.length <= n
    tri = (1..num).sum  # numth triangular number
    tri_factors = factors(tri)
    # p "tri: #{tri}, tri_factors: #{tri_factors}"
    num += 1 unless tri_factors.length > n
  end

  {n: n, tri: tri, num: num, tri_factors_length: tri_factors.length}
end

# p tri_with_factors(0)  # => "please use a positive integer"
# p tri_with_factors(-10)  # => "please use a positive integer"
# p tri_with_factors(3.14)  # => "please use a positive integer"

# p Benchmark.measure { (1..100).each { |n| p tri_with_factors(n) } }  # 17.13 seconds - too long!

# p Benchmark.measure { p tri_with_factors(150) }  # takes nearly 30 seconds to compute!

require 'prime'

# (1..100).each { |n| p Hash[n, Prime.prime_division(n)] }

def factors2(number)
  return [1] if number == 1
  prime_factorization = Prime.prime_division(number)  # get the prime factors with their exponents
  factors = prime_factorization.map { [] }  # initialize output array with empty subarrays
  
  # iterate through prime_factorization array to populate output array with all factors multiplied out
  prime_factorization.each_with_index do |factor_subarray, index|
    exponent = 0
  
    while exponent <= factor_subarray[1]
      factors[index] << factor_subarray[0] ** exponent  # shovel powers of factors into each output subarray
      exponent += 1
    end
  end
  
  if factors.length == 1
    factors.flatten  # for 2 and all primes
  else
    factors[0].product(*factors[1..-1]).map { |factor_subarray| factor_subarray.reduce(:*) }.sort  # generate all factors by multiplying all combinations of factor subarrays
  end
end

# p Benchmark.measure { (2..1000).each { |n| p factors(n) } }  # .057 seconds
# p Benchmark.measure { (2..1000).each { |n| p factors2(n) } }  # .01 seconds - better!

def tri_with_factors2(n)
  return "please use a positive integer" if n < 1 or n.class != Integer
  num = 1
  tri_factors = [1]

  while tri_factors.length <= n
    tri = (1..num).sum  # numth triangular number
    tri_factors = factors2(tri)  # get the factors of tri
    # p "tri: #{tri}, tri_factors: #{tri_factors}"
    num += 1 unless tri_factors.length > n  # stop incrementing num once the required # of factors (n) is exceeded
  end

  {n: n, tri: tri, num: num, tri_factors_length: tri_factors.length}
end

p Benchmark.measure { (1..100).each { |n| p tri_with_factors2(n) } }  # .165 seconds!

p Benchmark.measure { p tri_with_factors2(150) }  # .021 seconds!!
p Benchmark.measure { p tri_with_factors2(500) }  # .51 seconds!!!

# ~~~

# n! means n * (n - 1) * ... * 3 * 2 * 1.

# For example, 10! = 10 * 9 * ... * 3 * 2 * 1 = 3628800,
# and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

# Find the sum of the digits in the number 100!

def factorial(number)
  (1..number).reduce(:*)
end

p factorial(100).to_s.chars.map(&:to_i).sum

# ~~~

# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

# What is the sum of the digits of the number 2^1000?

p (2 ** 1000).to_s.chars.map(&:to_i).sum

#  ~~~

# The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.

# Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.

def self_power_series(upper_limit)
  (1..upper_limit).reduce { |sum, num| sum += num ** num }
end

p self_power_series(1000).to_s[-10..-1].to_i
