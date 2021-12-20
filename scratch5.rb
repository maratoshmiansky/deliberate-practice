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
  input_array.each_with_object(Hash.new(0)) { |element, tally| tally[element] += 1 }.find { |_, value| value > 1}.first
end

p return_duplicate([5, 2, 9, 7, 2, 6]) # => 2
p return_duplicate([1, 1, 2, 3]) # => 1
p return_duplicate(%w(live laugh love laugh)) # => "laugh"

# ~~~

# A given string contains all the letters from the alphabet except for one. Return the missing letter.

# NOTE: You must accomplish this in O(n) time. This is also known as linear time.

# Input: “The quick brown box jumps over a lazy dog”
# Output: “f”

def missing_letters(input_string)
  ("a".."z").reject { |letter| input_string.downcase.include?(letter) }.join # this works for multiple missing letters, too
end

p missing_letters("The quick brown box jumps over a lazy dog") # => "f"
p missing_letters("The quick brown fox jumps over a lazy dog") # => ""
p missing_letters("abcdefghjklmnopqrstuvwxyz") # => "i"
p missing_letters("aeiou") # => "bcdfghjklmnpqrstvwxyz"
p missing_letters("Which letters (from a to z) are missing from this sentence?") # => "bdjkpquvxy"

# ~~~

# Given a string, find the first non-repeating character in it and return its index. If it doesn't exist, return -1.

# NOTE: You must accomplish this in O(n) time. This is also known as linear time.

# Examples:

# s = "leetcode"
# return 0.
# (The "l" is the first character that only appears once in the string, and appears at index 0.)

# s = "loveleetcode",
# return 2.
# (The "l" and "o" are repeated, so the first non-repeating character is the "v", which is at index 2.)

# Note: You may assume the string contains only lowercase letters.

def first_non_repeating_char(input_string)
  input_tally = input_string.chars.each_with_object(Hash.new(0)) { |char, tally| tally[char] += 1}
  first_non_repeat = input_tally.find { |_, value| value == 1 }
  first_non_repeat ? input_string.index(first_non_repeat.first) : -1
end

p first_non_repeating_char("leetcode") # => 0
p first_non_repeating_char("loveleetcode") # => 2
p first_non_repeating_char("mmaarat") # => 4
p first_non_repeating_char("mmaarraatt") # => -1

# ~~~

# This is the same exercise as Two Sum I, but you must now solve it in linear time.

# Given an array of numbers, return a new array containing just two numbers (from the original array) that add up to the number 10. If there are no two numbers that add up to 10, return false.

# Input: [2, 5, 3, 1, 0, 7, 11]
# Output: [3, 7]

# Input: [1, 2, 3, 4, 5]
# Output: false (While 1, 2, 3, and 4 altogether add up to 10, we're seeking just one pair of numbers.)

# NOTE: result is unpredictable if num_array contains more than one pair of numbers that add up to target
def two_sum(num_array, target)
  checked = {}

  num_array.each_with_index do |num, index|
    diff = target - num
    return [num_array[checked[diff]], num_array[index]] if checked[diff]
    checked[num] = index
  end

  return false # if no two numbers add up to target
end

p two_sum([2, 5, 3, 1, 0, 7, 11], 10) # => [3, 7]
p two_sum([1, 2, 3, 4, 5], 10) # => false
p two_sum([1, 19, 3, 17, 20, 0], 21) # => [1, 20]
p two_sum([1, 0], 0) # => false
