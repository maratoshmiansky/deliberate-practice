# calculate the nth term of the Fibonacci series
def fib(n)
  return "try again" if n < 0
  return 0 if n == 0
  return 1 if n == 1 || n == 2

  fib_terms = [0, 1, 1]
  term_counter = 3 # will be used as a counter until the nth term is calculated

  while term_counter <= n
    fib_terms << fib_terms[-2] + fib_terms[-1] # shovel next term into output array
    fib_terms = fib_terms[-3..-1] # only keeping the last three terms
    term_counter += 1
  end

  fib_terms.last
end

def fib2(n)
  return "try again" if n < 0
  return 0 if n == 0
  return 1 if n == 1 || n == 2

  fib_terms = [0, 1, 1]
  term_counter = 3 # will be used as a counter until the nth term is calculated

  while term_counter <= n
    fib_terms = [fib_terms[-2], fib_terms[-1], fib_terms[-2] + fib_terms[-1]] # keeping the (n - 2)th and (n - 1)th terms and calculating the nth term
    term_counter += 1
  end

  fib_terms.last
end

require 'prime'
require 'benchmark'

p (0..100).map { |n| fib(n) }.select { |n| n.prime? } # outputs array of prime Fibonacci terms (through the 100th term)
# p Benchmark.measure { fib(200000) } # .549 seconds
# p Benchmark.measure { fib(300000) } # 1.138 seconds
# p Benchmark.measure { fib(400000) } # 1.966 seconds
# p Benchmark.measure { fib2(200000) } # .522 seconds
# p Benchmark.measure { fib2(300000) } # 1.127 seconds
# p Benchmark.measure { fib2(400000) } # 1.928 seconds

# ~~~

# Given two arrays, determine whether one is a subset of the other. It is considered a subset if all the values in one array are contained within the other.

# NOTE: You must accomplish this in O(n) time. This is also known as linear time.

# Input: [1, 2, 3, 4, 5, 6], [6, 3, 2]
# Output: true

# Input: [1, 2, 3, 4, 5, 6], [6, 3, 7]
# Output: false

# assume that num_array2.length <= num_array1.length, that duplicate terms are ignored (as they would be in a set) and that [] is akin to the empty set
def num_array_subset?(num_array1, num_array2)
  num_array2.each { |num| return false unless num_array1.include?(num) }

  true
end

p num_array_subset?([1, 2, 3, 4, 5, 6], [6, 3, 2]) # => true
p num_array_subset?([1, 2, 3, 4, 5, 6], [6, 3, 7]) # => false
p num_array_subset?([9, 1, 7, 3, 5], [1, 5, 3]) # => true
p num_array_subset?([9, 1, 7, 3, 5], []) # => true
p num_array_subset?([], []) # => true
p num_array_subset?([7, 8, 9], []) # => true
p num_array_subset?([1, 3, 2], [2, 2]) # => true
p num_array_subset?([1, 3, 2], [2, 4]) # => false

# ~~~

# A given array has one pair of duplicate values. Return the first duplicate value.

# NOTE: You must accomplish this in O(n) time. This is also known as linear time.

# Input: [5, 2, 9, 7, 2, 6]
# Output: 2

def return_duplicate(input_array)
  input_array.each_with_object(Hash.new(0)) { |element, tally| tally[element] += 1 }.select { |_, value| value > 1}.keys.shift
end

p return_duplicate([5, 2, 9, 7, 2, 6]) # => 2
p return_duplicate([1, 1, 2, 3]) # => 1
p return_duplicate(%w(live laugh love laugh)) # => "laugh"
