#1 Given two sorted arrays, merge the second array into the first array while ensuring that the first array remains sorted. Do not use any built-in sort methods.

# Input :
# A : [1, 5, 8]
# B : [6, 9]

# Modified A : [1, 5, 6, 8, 9]

def merge_sorted_arrays(array1, array2)
  index = 0  # to iterate through array1
  while !array2.empty? do
    if index < array1.length  # this condition avoids indexing past the last number in array1
      if array2[0] <= array1[index]
        array1.insert(index, array2.shift)  # move the number at array2[0] into array1 at the current index (array2's numbers shift left)
        index += 1  # to move the index one number past the inserted number
      end
      index += 1
    else
      array1 << array2.shift  # to catch (all) the last number(s) in array2 that is (are) greater than the last number in array1
    end
  end
  array1
end

p merge_sorted_arrays([1, 5, 8], [6, 9])  # => [1, 5, 6, 8, 9]
p merge_sorted_arrays([-2, 3, 4, 12], [-3, 0, 12])  # => [-3, -2, 0, 3, 4, 12, 12]
p merge_sorted_arrays([1, 2, 3, 4], [3, 4, 5, 6, 7])  # => [1, 2, 3, 3, 4, 4, 5, 6, 7]
p merge_sorted_arrays([], [10, 13, 18, 26])  # => [10, 13, 18, 26]
p merge_sorted_arrays([4, 6, 8, 10], [])  # => [4, 6, 8, 10]
p merge_sorted_arrays([-1, -1, -1, -1], [-1, -1, -1, -1])  # => [-1, -1, -1, -1, -1, -1, -1, -1]
p merge_sorted_arrays([-1, -1, -1, -1], [1, 1, 1, 1])  # => [-1, -1, -1, -1, 1, 1, 1, 1]
p merge_sorted_arrays([-11, 12], [0, 19])  # => [-11, 0, 12, 19]
p merge_sorted_arrays([], [])  # => []

#2 Write a function to find the longest common prefix string amongst an array of strings.

# If there is no common prefix, return an empty string "".

# Example 1:

# Input: ["flower","flow","flight"]
# Output: "fl"
# Example 2:

# Input: ["dog","racecar","car"]
# Output: ""
# Explanation: There is no common prefix among the input strings.
# Note:

# All given inputs are in lowercase letters a-z.

def longest_common_prefix(string_array)
  return "" if string_array.include?("")  # no common prefix if input array contains an empty string, so we break out

  shortest_string_length = string_array.min.length  # we only need to match as many characters as the shortest string in the input array
  common_prefix = ""
  prefix_match = true
  char_index = 0  # to index through each string's characters
  
  while char_index < shortest_string_length && prefix_match do
    index = 1  # to start the comparison with the second string
    while index < string_array.length && prefix_match do
      if string_array[0][char_index] != string_array[index][char_index]
        prefix_match = false  # to break out of the loops
      end
      index += 1
    end
    if prefix_match
      common_prefix += string_array[0][char_index]  # if all strings in the input array matched at char_index, we have a common prefix
    end
    char_index += 1
  end

  common_prefix
end

p longest_common_prefix(["flower", "flow", "flight"])  # => "fl"
p longest_common_prefix(["dog", "racecar", "car"])  # => ""
p longest_common_prefix(["mammal", "mammary", "madam", "master", "madder"])  # => "ma"
p longest_common_prefix(["boy", "", "girl", ""])  # => ""
p longest_common_prefix(["123456789", "12345678", "1234567", "123456", "12345", "1234"])  # => "1234"
p longest_common_prefix(["maratical", "marat", "marta", "mars"])  # => "mar"
p longest_common_prefix(["hello", "hello", "hello", "hello"])  # => "hello"

#3 Given two strings, return true if they are anagrams of each other, and false if they are not. An anagram is a word, phrase, or name formed by rearranging the letters of another, such as cinema, formed from iceman.

# Do not use any built-in sort methods.

# Input: “silent”, “listen”
# Output: true

# Input: “frog”, “bear”
# Output: false

def anagrams?(string1, string2)
  # we create two hashes from string1 and string2 to tally the # of times each letter/character occurs - if the hashes are equal, the strings are anagrams
  string1_tally = {}
  string2_tally = {}
  string1.each_char { |char| string1_tally[char] ? string1_tally[char] += 1 : string1_tally[char] = 1 }  # create tally hash for string1
  string2.each_char { |char| string2_tally[char] ? string2_tally[char] += 1 : string2_tally[char] = 1 }  # create tally hash for string2
  string1_tally == string2_tally  # returns true if both string tallies are equal, returns false otherwise
end

p anagrams?("silent", "listen")  # => true
p anagrams?("frog", "bear")  # => false
p anagrams?("marat", "marta")  # => true
p anagrams?("hello", "hell")  # => false
p anagrams?("x", "")  # => false
p anagrams?("", "")  # => true

#4 Write a function to calculate the nth Fibonacci number (for n >= 0) recursively, where the Fibonacci sequence is given by:

# 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ... (nth Fibonacci # = (n - 1)th Fibonacci # + (n - 2)th Fibonacci #)

# ex1: fib(0) = 0
# ex2: fib(1) = 1
# ex3: fib(4) = 3
# ex4: fib(8) = 21

def fib(num)
  return num if num == 0 || num == 1  # fib(0) = 0, fib(1) = 1
  nth_fib = fib(num - 1) + fib(num - 2)  # nth_fib is returned after all recursive calls to fib
end

p fib(0)  # => 0
p fib(1)  # => 1
p fib(4)  # => 3
p fib(8)  # => 21
p fib(12)  # => 144

#5 A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

# Find the largest palindrome made from the product of two 3-digit numbers.

def largest_palindrome_product
  num1 = 100
  largest = [10000, 100, 100]  # initial product is 10000 (100 * 100)
  while num1 <= 999
    num2 = 100
    while num2 <= 999
      product = num1 * num2
      if product.to_s == product.to_s.reverse && product > largest[0]
        largest = [product, num1, num2]
      end
      num2 += 1
    end
    num1 += 1
  end
  largest  # return an array containing the largest palindrome product and the corresponding multiplicands
end

p largest_palindrome_product

#6 If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

# Find the sum of all the multiples of 3 or 5 below 1000.

def sum_of_multiples
  sum = 0
  n = 1
  while n < 1000
    if n % 3 == 0 || n % 5 == 0
      sum += n
    end
    n += 1
  end 
  sum
end

p sum_of_multiples

#7 Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:

# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

# By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

def sum_of_fib
  a = 1
  b = 2
  c = a + b
  sum = b  # initialize the sum of the even-valued terms of the Fibonacci sequence
  while c < 4000000
    sum += c if c.even?
    a, b = b, c  # advance the addend terms
    c = a + b  # calculate the next term in the sequence by adding the previous two terms
  end
  sum  # return the sum of the even-valued terms not exceeding 4,000,000
end

p sum_of_fib

#8 The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143?

# First implementation using Ruby's prime library

require "prime"

# 600851475143 = 71 * 839 * 1471 * 6857
p 600851475143.prime_division.map { |pair| pair[0] }.max  # => 6857

# Second implementation using Ruby's prime library

def largest_prime_factor(num)
  return "try again with an integer >= 2" if num < 2
  return num if num.prime?  # if num is composite then continue on
  div_max = Math.sqrt(num).ceil  # we only need to divide num by primes < div_max
  if num.even?  # eliminate 2 as a prime divisor so we can increment div by 2 each time through the loop below
    num /= 2
    largest = 2
  else
    largest = 1
  end
  div = 3  # first prime divisor to test (after testing evenness above)

  while div <= div_max
    if div.prime? && num % div == 0
      largest = div
      num /= div
    end
    div += 2  # only checking odd divisors > 2
  end

  largest
end

p largest_prime_factor(1)  # => "try again with an integer >= 2"
p largest_prime_factor(2)  # => 2
p largest_prime_factor(16)  # => 2
p largest_prime_factor(17)  # => 17
p largest_prime_factor(18)  # => 3
p largest_prime_factor(81)  # => 3
p largest_prime_factor(101)  # => 101
p largest_prime_factor(1001)  # => 13
p largest_prime_factor(13195)  # => 29
p largest_prime_factor(600851475143)  # => 6857

#9 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

def smallest_divisible(upper)
  return "try an integer >= 1" if upper < 1
  return upper if upper.between?(1, 2)
  n = 1
  num = 2
  
  while n <= upper
    if num % n == 0
      n += 1
    else
      n = 1
      num += 2  # we only need to test even numbers
    end    
  end

  num
end

p smallest_divisible(0)  # => "try an integer >= 1"
p smallest_divisible(1)  # => 1
p smallest_divisible(2)  # => 2
p smallest_divisible(3)  # => 6
p smallest_divisible(5)  # => 60
p smallest_divisible(10)  # => 2520
p smallest_divisible(20)  # => 232792560 (this takes much too long to compute!)
